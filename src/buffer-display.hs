-- http://sccode.org/1-1HR (f0)
-- partial...

import Data.IORef
import qualified Foreign.C.Math.Double as M {- cmath -}
import qualified Graphics.Rendering.Cairo as C {- cairo -}
import qualified Graphics.UI.Gtk as G {- gtk -}
import qualified Graphics.UI.Gtk.Gdk.Events as E
import Sound.OpenSoundControl {- hosc -}
import qualified Sound.SC3 as S {- hsc3 -}

type R = Double
data BD_Type = BD_Line | BD_Warp | BD_Flower
data BD = BD {sc3 :: UDP
             ,theta :: R
             ,buffer :: Int
             ,buffer_sz :: Int
             ,cnt :: Int
             ,trails :: R
             ,speed :: R
             ,amplitude :: R
             ,version :: BD_Type}

default_bd :: UDP ->  BD
default_bd fd = BD fd 0 10 512 0 1 0 0.5 BD_Line

rotate_about :: R -> R -> R -> C.Render ()
rotate_about a x y = do
  C.translate x y
  C.rotate a
  C.translate (-x) (-y)

pt_rotate :: R -> (R,R) -> (R,R)
pt_rotate a (x,y) =
    let s = sin a
        c = cos a
    in ((x * c) - (y * s),(y * c) + (x * s))

render_line :: BD -> [R] -> R -> C.Render ()
render_line bd s n = do
  let a = amplitude bd
  rotate_about (theta bd) (n/2) (n/2)
  C.translate 0 (n/2)
  let f (x,y) = let y' = (y * n * a)
                in if x == 0 then C.moveTo x y' else C.lineTo x y'
  mapM_ f (zip [0..] s)
  C.stroke

render_warp :: BD -> [R] -> R -> C.Render ()
render_warp bd s n = do
  let a = amplitude bd
  rotate_about (theta bd) (n/2) (n/2)
  C.translate (n/2) (n/2)
  let f (x,y) = let (x',y') = pt_rotate (y * 2 * pi) (x * a,y * a)
                in if x == 0 then C.moveTo x' y' else C.lineTo x' y'
  mapM_ f (zip [0..] s)
  C.stroke

render_flower :: BD -> [R] -> R -> C.Render ()
render_flower bd s n = do
  let s0 = s !! 0
  C.translate (n/2) (n/2)
  C.moveTo (s0*s0) 0
  let f (x,y) = let a = ((x `M.fmod` n) / n) * 2 * pi + theta bd
                    (x',y') = pt_rotate a (y * y,x * y)
                in C.lineTo x' y'
  mapM_ f (zip [0..] s)
  C.stroke

render_bd :: BD -> [R] -> C.Render BD
render_bd bd s = do
  let n = fromIntegral (buffer_sz bd)
  C.rectangle 0 0 n n
  C.setSourceRGBA 0 0 0 (trails bd)
  C.fill
  C.setSourceRGBA 0 1 0 1
  case version bd of
    BD_Line -> render_line bd s n
    BD_Warp -> render_warp bd s n
    BD_Flower -> render_flower bd s n
  return bd

unf :: Datum -> R
unf d =
    case d of
      Float x -> x
      Double x -> x
      _  -> error "unf: non-float"

read_b :: BD -> IO [R]
read_b bd = do
  let b = buffer bd
      fd = sc3 bd
      n = buffer_sz bd
  S.send fd (S.b_getn b [(0,n)])
  r <- wait fd "/b_setn"
  case r of
    Message "/b_setn" (_:Int 0:Int _:xs) -> return (map unf xs)
    _ -> return []

update :: G.DrawingArea -> IORef BD -> IO Bool
update c r = do
  w <- G.widgetGetDrawWindow c
  bd <- readIORef r
  s <- read_b bd
  _ <- G.renderWithDrawable w (render_bd bd s)
  writeIORef r (bd {theta = theta bd + speed bd
                   ,cnt = cnt bd + 1})
  return True

keypress :: G.WidgetClass w => w -> IORef BD -> E.Event -> IO Bool
keypress w r e = do
  let nm = E.eventKeyName e
  case nm of
    "Escape" -> G.widgetDestroy w
    "T" -> modifyIORef r (\bd -> bd {trails = trails bd + 0.1})
    "t" -> modifyIORef r (\bd -> bd {trails = trails bd - 0.1})
    "S" -> modifyIORef r (\bd -> bd {speed = speed bd + 0.1})
    "s" -> modifyIORef r (\bd -> bd {speed = speed bd - 0.1})
    "w" -> modifyIORef r (\bd -> bd {version = BD_Warp})
    "l" -> modifyIORef r (\bd -> bd {version = BD_Line})
    "f" -> modifyIORef r (\bd -> bd {version = BD_Flower})
    _ -> print nm
  return True

bd_run :: BD -> IO (IORef BD)
bd_run bd = do
  _ <- G.initGUI
  w <- G.windowNew
  c <- G.drawingAreaNew
  r <- newIORef bd
  let n = buffer_sz bd
  _ <- S.async (sc3 bd) (S.b_alloc (buffer bd) n 1)
  G.windowSetResizable w False
  G.widgetSetSizeRequest w n n
  _ <- G.onKeyPress w (keypress w r)
  _ <- G.onDestroy w G.mainQuit
  _ <- G.onExpose c (const (update c r))
  _ <- G.timeoutAdd (G.widgetQueueDraw w >> return True) 15
  G.set w [G.containerChild G.:= c]
  G.widgetShowAll w
  G.mainGUI
  return r

sc3_fd :: IO UDP
sc3_fd = openUDP "127.0.0.1" 57110

main :: IO ()
main = fmap default_bd sc3_fd >>= bd_run >> return ()

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

fd <- sc3_fd
bd_run (BD fd 0 10 512 0 1 0 0.5 BD_Line)
bd_run (BD fd 0 10 512 0 1 0 0.5 BD_Warp)
bd_run (BD fd 0 10 512 0 1 0 0.5 BD_Flower)
-}
