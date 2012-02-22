-- http://sccode.org/1-1HR (f0)
-- partial...

import Data.CG.Minus {- hcg-minus -}
import Data.IORef
import Data.List
import Data.List.Split {- split -}
import qualified Foreign.C.Math.Double as M {- cmath -}
import qualified Graphics.Rendering.Cairo as C {- cairo -}
import qualified Graphics.UI.Gtk as G {- gtk -}
import qualified Graphics.UI.Gtk.Gdk.Events as E
import Sound.OpenSoundControl {- hosc -}
import Sound.SC3 {- hsc3 -}

-- * Type

data BD_Type = BD_Line | BD_Warp | BD_Flower
data BD = BD {gain :: R
             ,theta :: R
             ,theta_incr :: R
             ,trails :: R
             ,version :: BD_Type}

bd_default :: BD
bd_default = BD 0.5 0 0 1 BD_Line

-- * Render

rotate_about :: R -> R -> R -> C.Render ()
rotate_about a x y = do
  C.translate x y
  C.rotate a
  C.translate (-x) (-y)

render_line :: R -> R -> [R] -> C.Render ()
render_line n a d = do
  C.translate 0 (n/2)
  let f (x,y) = let y' = (y * n * a)
                in if x == 0 then C.moveTo x y' else C.lineTo x y'
  mapM_ f (zip [0..] d)
  C.stroke

pt_rotate' :: Floating a => a -> a -> a -> (a,a)
pt_rotate' a x y = pt_xy (pt_rotate a (pt x y))

render_warp :: R -> R -> [R] -> C.Render ()
render_warp n a d = do
  C.translate (n/2) (n/2)
  let f (x,y) = let (x',y') = pt_rotate' (y * 2 * pi) (x * a) (y * a)
                in if x == 0 then C.moveTo x' y' else C.lineTo x' y'
  mapM_ f (zip [0..] d)
  C.stroke

render_flower :: R -> R -> [R] -> C.Render ()
render_flower n t d = do
  let d0 = d !! 0
  C.translate (n/2) (n/2)
  C.moveTo (d0 * d0) 0
  let f (x,y) = let a = ((x `M.fmod` n) / n) * 2 * pi + t
                    (x',y') = pt_rotate' a (y * y) (x * y)
                in C.lineTo x' y'
  mapM_ f (zip [0..] d)
  C.stroke

bd_render :: Render_F BD
bd_render sh bd = do
  let n = fromIntegral (sh_nf sh)
      a = gain bd
      t = theta bd
      v = version bd
      r = case v of
            BD_Flower -> return ()
            _ -> rotate_about t (n/2) (n/2)
  C.rectangle 0 0 n n
  C.setSourceRGBA 0 0 0 (trails bd)
  C.fill
  C.setSourceRGBA 0 1 0 1
  let f d = case version bd of
              BD_Line -> render_line n a d
              BD_Warp -> render_warp n a d
              BD_Flower -> render_flower n t d
      g d = C.save >> r >> f d >> C.restore
  mapM_ g (sh_data sh)
  return (bd {theta = t + theta_incr bd})

-- * Key

bd_key :: Key_F BD
bd_key k bd =
    case k of
      'T' -> bd {trails = trails bd + 0.025}
      't' -> bd {trails = trails bd - 0.025}
      'S' -> bd {theta_incr = theta_incr bd + 0.025}
      's' -> bd {theta_incr = theta_incr bd - 0.025}
      'w' -> bd {version = BD_Warp}
      'l' -> bd {version = BD_Line}
      'f' -> bd {version = BD_Flower}
      'z' -> bd {theta = 0}
      _ -> bd

-- * Shell

bd_shell :: Int -> Shell BD
bd_shell nc = sh_default nc bd_render bd_key

main :: IO ()
main = shell (bd_shell 1) bd_default

-- * Shell Implemetation

type Render_F st = Shell st -> st -> C.Render st
type Interact_F st = UDP -> Shell st -> st -> IO st
type Bracket_F st = (Interact_F st,Interact_F st)
type SC3_F st = Interact_F st
type Key_F st = Char -> st -> st
data Shell st = Shell {sh_gr :: Int -- ^ Group (protected)
                      ,sh_nc :: Int -- ^ Number of channels
                      ,sh_nf :: Int -- ^ Number of frames
                      ,sh_b :: Int -- ^ Buffer ID
                      ,sh_ix :: Int -- ^ Bus index
                      ,sh_data :: [[R]] -- ^ Signal data
                      ,sh_bracket :: Bracket_F st
                      ,sh_sc3 :: SC3_F st
                      ,sh_render :: Render_F st
                      ,sh_key :: Key_F st
                      ,sh_delay :: Int -- ^ Frame delay in ms
                      }

sh_bracket_nil :: Bracket_F st
sh_bracket_nil =
    let no_op _ _ st = return st
    in (no_op,no_op)

sh_sc3_nil :: SC3_F st
sh_sc3_nil _ _ st = return st

sh_monitor_bus :: Transport t => Shell st -> t -> IO ()
sh_monitor_bus sh fd = do
  let b = fromIntegral (sh_b sh)
      ix = fromIntegral (sh_ix sh)
      i = in' (sh_nc sh) AR ix
      r = recordBuf AR b 0 1 0 1 Loop 1 DoNothing i
      s = synthdef "sh_monitor_bus" r
  _ <- async fd (d_recv s)
  _ <- async fd (b_alloc (sh_b sh) (sh_nf sh) (sh_nc sh))
  send fd (g_new [(sh_gr sh,AddToTail,0)])
  send fd (s_new "sh_monitor_bus" (-1) AddToTail (sh_gr sh) [])

deinterleave :: Int -> [a] -> [[a]]
deinterleave nc l =
    case nc of
      1 -> [l]
      _ -> transpose (splitEvery nc l)

sh_std_sc3 :: Transport t => Shell st -> t -> IO (Shell st)
sh_std_sc3 sh fd = do
  let b = sh_b sh
      nf = sh_nf sh
      nc = sh_nc sh
  send fd (b_getn b [(0,nf * nc)])
  r <- wait fd "/b_setn"
  let d = case r of
            Message "/b_setn" (_:Int 0:Int _:xs) -> map datum_real' xs
            _ -> []
  return (sh {sh_data = deinterleave nc d})

sh_on_close :: UDP -> Shell b -> b -> IO b
sh_on_close fd sh st = do
  let (_,c_f) = sh_bracket sh
  send fd (n_free [3])
  c_f fd sh st

sh_keypress_f :: G.WidgetClass w =>
                 w -> IORef st -> UDP -> Shell st -> E.Event -> IO Bool
sh_keypress_f w r fd sh e = do
  let kv = E.eventKeyVal e
      nm = E.eventKeyName e
  case nm of
    "Escape" -> do st <- readIORef r
                   _ <- sh_on_close fd sh st
                   G.widgetDestroy w
    _ -> case G.keyToChar kv of
           Just c -> modifyIORef r (sh_key sh c)
           _ -> return ()
  return True

sh_update_f :: G.WidgetClass w =>
               w -> C.Surface -> IORef st -> UDP -> Shell st -> IO Bool
sh_update_f c s r fd sh = do
  w <- G.widgetGetDrawWindow c
  bd <- readIORef r
  sh' <- sh_std_sc3 sh fd
  bd' <- sh_sc3 sh' fd sh' bd >>= C.renderWith s . sh_render sh' sh'
  C.surfaceFlush s
  _ <- G.renderWithDrawable w (C.setSourceSurface s 0 0 >> C.paint)
  writeIORef r bd'
  return True

sc3_fd :: IO UDP
sc3_fd = openUDP "127.0.0.1" 57110

shell :: Shell st -> st -> IO ()
shell sh i_st = do
  let n = sh_nf sh
      n' = fromIntegral n
      (i_f,_) = sh_bracket sh
  fd <- sc3_fd
  st <- i_f fd sh i_st
  sh_monitor_bus sh fd
  r <- newIORef st
  s <- C.createImageSurface C.FormatARGB32 n n
  C.renderWith s (do C.rectangle 0 0 n' n'
                     C.setSourceRGBA 0 0 0 1
                     C.fill)
  _ <- G.initGUI
  w <- G.windowNew
  c <- G.drawingAreaNew
  G.windowSetResizable w False
  G.widgetSetSizeRequest w n n
  _ <- G.onKeyPress w (sh_keypress_f w r fd sh)
  _ <- G.onDestroy w G.mainQuit
  _ <- G.onExpose c (const (sh_update_f c s r fd sh))
  _ <- G.timeoutAdd (G.widgetQueueDraw w >> return True) (sh_delay sh)
  G.set w [G.containerChild G.:= c]
  G.widgetShowAll w
  G.mainGUI

sh_default :: Int -> Render_F st -> Key_F st -> Shell st
sh_default nc r k = Shell 3 nc 512 10 0 [] sh_bracket_nil sh_sc3_nil r k 15

{-

let s = saw AR (mouseX KR 20 800 Exponential 0.2)
in audition (out 0 s)

let {v = varSaw AR (mouseX KR 1 1000 Linear 0.2) 0 0.5
    ;f = bpf v (mouseY KR 50 5000 Linear 0.2) 0.5
    ;s = sinOsc AR 0 f}
in audition (out 0 s)

Control.Concurrent.forkIO (shell (bd_shell 1) bd_default)

import Sound.SC3.ID

let {x = mouseX KR 1 1000 Linear 0.2
    ;y = mouseY KR 50 5000 Linear 0.2
    ;v = varSaw AR x 0 0.5
    ;f = bpf v y 0.5
    ;s = sinOsc AR 0 f
    ;n = brownNoise 'a' AR * 0.1}
in audition (out 0 (mce2 s n))

Control.Concurrent.forkIO (shell (bd_shell 2) bd_default)

-}
