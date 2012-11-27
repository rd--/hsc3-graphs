-- lin-sosc (rd)

import Control.Concurrent
import Control.Monad
import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Random.IO as R {- hsc3-lang -}

iota :: (Num a,Eq a,Num b) => a -> b -> b -> [b]
iota n l s = if n == 0 then [] else l : iota (n - 1) (l + s) s

geom :: (Num a,Eq a,Num b) => a -> b -> b -> [b]
geom n i f = if n == 0 then [] else i : geom (n - 1) (i * f) f

lineTo :: (Fractional a,Eq a) => a -> a -> a -> [a]
lineTo n l r = iota n l ((r - l) / n)

xlineTo :: (Floating a,Eq a) => a -> a -> a -> [a]
xlineTo n l r = geom n l ((r / l) ** (1.0 / n))

tblM :: UGen -> UGen -> UGen
tblM b x = playBuf 1 AR b (x * bufRateScale KR b) 0 0 Loop DoNothing

tblC :: UGen -> UGen -> UGen
tblC b c = tblM b (in' 1 KR c)

lin_sosc :: UGen
lin_sosc =
    let x = mouseX KR 0.001 1.0 Linear 0.1
        o = sinOsc AR (tblM 0 x) 0 * tblM 1 x
    in clip2 (pan2 o (tblC 1 0) 0.025) 0.25

twoPi :: Double
twoPi = pi * 2.0

srng :: Fractional a => a -> a -> a -> a
srng l r e =
    let m = (l - r ) / 2
    in m + l + (e * m)

type Lin_Data = ([[Double]], [[Double]], [Double], [Double])

lin_data :: Double -> Lin_Data
lin_data n =
    let f = [lineTo n 440.0 444.0
            ,lineTo n 40.0 16000.0
            ,xlineTo n 40.0 16000.0
            ,map (srng 20 21000 . sin) (lineTo n 0.0 twoPi)
            ,map (srng 20 12000 . cos) (lineTo n 0.0 twoPi)
            ,map (srng 20 22000 . tan) (lineTo n 0.0 twoPi)
            ,map (srng 20 90 . tan) (lineTo n 0.0 twoPi)]
        a = [lineTo n 0.1 1.0
            ,lineTo n 1.0 0.1
            ,lineTo n 0.5 0.01
            ,lineTo n 0.01 0.5
            ,xlineTo n 1.0 0.1
            ,xlineTo n 0.1 1.0
            ,map sin (lineTo n 0.0 twoPi)
            ,map cos (lineTo n 0.0 twoPi)
            ,map ((* 0.001) . tan) (lineTo n 0 twoPi)]
        l = [0.005,0.0075,0.01,0.025,0.05,0.075
            ,0.1,0.25,0.5,0.75
            ,0.8,0.85,1.0,1.005]
        t = [0.01,0.05,0.1,0.15,0.25,0.5,0.75]
    in (f,a,l,t)

update :: Transport m => Lin_Data -> m ()
update (f,a,l,t) = do
  f' <- R.choose f
  a' <- R.choose a
  l' <- R.choose l
  t' <- R.choose t
  send (b_setn 0 [(0,f')])
  send (b_setn 1 [(0,a')])
  send (c_set [(0,l')])
  pauseThread t'

do_update :: Double -> IO ()
do_update n = withSC3 (replicateM_ 128 (update (lin_data n)))

run :: (Transport m, RealFrac a) => a -> m ()
run n = do
  _ <- async (b_alloc 0 (floor n) 1)
  _ <- async (b_alloc 1 (floor n) 1)
  play (out 0 lin_sosc)

main :: IO ()
main = do
  let n = 1024
  withSC3 (run n)
  _ <- forkIO (do_update n)
  return ()
