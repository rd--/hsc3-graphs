-- http://sccode.org/1-1HR (f0)

import Control.Concurrent {- base -}
import qualified Graphics.Rendering.Cairo as C {- cairo -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Cairo.Scope.Shell {- hsc3-cairo -}

-- * Type

type R = Double
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

pt_rotate :: Floating a => a -> (a,a) -> (a,a)
pt_rotate a (x,y) =
    let s = sin a
        c = cos a
    in (x * c - y * s,y * c + x * s)

render_warp :: R -> R -> [R] -> C.Render ()
render_warp n a d = do
  C.translate (n/2) (n/2)
  let f (x,y) = let (x',y') = pt_rotate (y * 2 * pi) (x * a,y * a)
                in if x == 0 then C.moveTo x' y' else C.lineTo x' y'
  mapM_ f (zip [0..] d)
  C.stroke

render_flower :: R -> R -> [R] -> C.Render ()
render_flower n t d = do
  let d0 = d !! 0
  C.translate (n/2) (n/2)
  C.moveTo (d0 * d0) 0
  let f (x,y) = let a = ((x `modE` n) / n) * 2 * pi + t
                    (x',y') = pt_rotate a (y * y,x * y)
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

-- * Audio...

instr :: UGen
instr =
    let x = mouseX KR 1 1000 Linear 0.2
        y = mouseY KR 50 5000 Linear 0.2
        v = varSaw AR x 0 0.5
        f = bpf v y 0.5
        s = sinOsc AR 0 f
        n = brownNoise 'α' AR * 0.1
    in out 0 (mce2 s n)

bd_shell :: Int -> Shell BD
bd_shell nc = sh_default nc bd_render bd_key

main :: IO ()
main = do
  audition instr
  _ <- forkIO (shell (bd_shell 2) bd_default)
  return ()

{-

import Sound.SC3

let s = saw AR (mouseX KR 20 800 Exponential 0.2)
in audition (out 0 s)

let {v = varSaw AR (mouseX KR 1 1000 Linear 0.2) 0 0.5
    ;f = bpf v (mouseY KR 50 5000 Linear 0.2) 0.5
    ;s = sinOsc AR 0 f}
in audition (out 0 s)

Control.Concurrent.forkIO (shell (bd_shell 1) bd_default)

-}
