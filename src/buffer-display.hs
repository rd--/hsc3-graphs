-- http://sccode.org/1-1HR (f0)
-- partial...

import Data.CG.Minus {- hcg-minus -}
import Data.IORef
import qualified Foreign.C.Math.Double as M {- cmath -}
import qualified Graphics.Rendering.Cairo as C {- cairo -}
import qualified Graphics.UI.Gtk as G {- gtk -}
import qualified Graphics.UI.Gtk.Gdk.Events as E
import Sound.OpenSoundControl {- hosc -}
import qualified Sound.SC3 as S {- hsc3 -}

-- * Type

data BD_Type = BD_Line | BD_Warp | BD_Flower
data BD = BD {buffer :: Int
             ,buffer_sz :: Int
             ,buffer_data :: [R]
             ,cnt :: Int
             ,amplitude :: R
             ,theta :: R
             ,theta_incr :: R
             ,trails :: R
             ,version :: BD_Type}

default_bd :: BD
default_bd = BD 10 512 [] 0 0.5 0 0 1 BD_Line

-- * Render

rotate_about :: R -> R -> R -> C.Render ()
rotate_about a x y = do
  C.translate x y
  C.rotate a
  C.translate (-x) (-y)

render_line :: R -> R -> [R] -> R -> C.Render ()
render_line a t d n = do
  rotate_about t (n/2) (n/2)
  C.translate 0 (n/2)
  let f (x,y) = let y' = (y * n * a)
                in if x == 0 then C.moveTo x y' else C.lineTo x y'
  mapM_ f (zip [0..] d)
  C.stroke

pt_rotate' :: Floating a => a -> a -> a -> (a,a)
pt_rotate' a x y = pt_xy (pt_rotate a (pt x y))

render_warp :: R -> R -> [R] -> R -> C.Render ()
render_warp a t d n = do
  rotate_about t (n/2) (n/2)
  C.translate (n/2) (n/2)
  let f (x,y) = let (x',y') = pt_rotate' (y * 2 * pi) (x * a) (y * a)
                in if x == 0 then C.moveTo x' y' else C.lineTo x' y'
  mapM_ f (zip [0..] d)
  C.stroke

render_flower :: R -> [R] -> R -> C.Render ()
render_flower t d n = do
  let d0 = d !! 0
  C.translate (n/2) (n/2)
  C.moveTo (d0 * d0) 0
  let f (x,y) = let a = ((x `M.fmod` n) / n) * 2 * pi + t
                    (x',y') = pt_rotate' a (y * y) (x * y)
                in C.lineTo x' y'
  mapM_ f (zip [0..] d)
  C.stroke

bd_render :: RENDER_F BD
bd_render bd = do
  let n = fromIntegral (buffer_sz bd)
      d = buffer_data bd
      a = amplitude bd
      t = theta bd
  C.rectangle 0 0 n n
  C.setSourceRGBA 0 0 0 (trails bd)
  C.fill
  C.setSourceRGBA 0 1 0 1
  case version bd of
    BD_Line -> render_line a t d n
    BD_Warp -> render_warp a t d n
    BD_Flower -> render_flower t d n
  return (bd {theta = theta bd + theta_incr bd
             ,cnt = cnt bd + 1})

-- * SC3

bd_init :: INIT_F BD
bd_init fd bd = do
  _ <- S.async fd (S.b_alloc (buffer bd) (buffer_sz bd) 1)
  return bd

bd_sc3 :: SC3_F BD
bd_sc3 fd bd = do
  let b = buffer bd
      n = buffer_sz bd
  S.send fd (S.b_getn b [(0,n)])
  r <- wait fd "/b_setn"
  let d = case r of
            Message "/b_setn" (_:Int 0:Int _:xs) -> map datum_real' xs
            _ -> []
  return (bd {buffer_data = d})

-- * Key

bd_key :: KEY_F BD
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

bd_shell :: SHELL BD
bd_shell = (default_bd,bd_init,bd_sc3,bd_render,bd_key)

-- * Shell Implemetation

type RENDER_F st = st -> C.Render st
type INIT_F st = UDP -> st -> IO st
type SC3_F st = UDP -> st -> IO st
type KEY_F st = Char -> st -> st
type SHELL st = (st,INIT_F st,SC3_F st,RENDER_F st,KEY_F st)

sh_keypress_f :: G.WidgetClass w => w -> IORef st -> KEY_F st -> E.Event -> IO Bool
sh_keypress_f w r key_f e = do
  let kv = E.eventKeyVal e
      nm = E.eventKeyName e
  case nm of
    "Escape" -> G.widgetDestroy w
    _ -> case G.keyToChar kv of
           Just c -> modifyIORef r (key_f c)
           _ -> return ()
  return True

sh_update_f :: G.WidgetClass w =>
               w -> C.Surface -> IORef st -> UDP -> SC3_F st -> RENDER_F st -> IO Bool
sh_update_f c s r fd sc3_f render_f = do
  w <- G.widgetGetDrawWindow c
  bd <- readIORef r >>= sc3_f fd >>= C.renderWith s . render_f
  C.surfaceFlush s
  _ <- G.renderWithDrawable w (C.setSourceSurface s 0 0 >> C.paint)
  writeIORef r bd
  return True

sc3_fd :: IO UDP
sc3_fd = openUDP "127.0.0.1" 57110

shell :: Int -> SHELL st -> IO ()
shell n sh = do
  let n' = fromIntegral n
      (i_st,init_f,sc3_f,render_f,key_f) = sh
  fd <- sc3_fd
  st <- init_f fd i_st
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
  _ <- G.onKeyPress w (sh_keypress_f w r key_f)
  _ <- G.onDestroy w G.mainQuit
  _ <- G.onExpose c (const (sh_update_f c s r fd sc3_f render_f))
  _ <- G.timeoutAdd (G.widgetQueueDraw w >> return True) 15
  G.set w [G.containerChild G.:= c]
  G.widgetShowAll w
  G.mainGUI

main :: IO ()
main = do
  let n = buffer_sz default_bd
  shell n bd_shell

{-
import Sound.SC3

let {s = saw AR (mouseX KR 20 800 Exponential 0.2)
    ;r = recordBuf AR 10 0 1 0 1 Loop 1 DoNothing s
    ;o = out 0 s}
in audition (mrg [o,r])

let {v = varSaw AR (mouseX KR 1 1000 Linear 0.2) 0 0.5
    ;f = bpf v (mouseY KR 50 5000 Linear 0.2) 0.5
    ;s = sinOsc AR 0 f
    ;r = recordBuf AR 10 0 1 0 1 Loop 1 DoNothing s
    ;o = out 0 s}
in audition (mrg [o,r])

shell 512 bd_shell
-}
