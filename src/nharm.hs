--nharm (rd)

import Control.Concurrent
import Control.Monad
import Sound.OSC
import Sound.SC3.Monadic as U
import Sound.SC3.Lang.Random.IO

nharm :: (Num b, Integral a) => a -> b -> [b]
nharm n f = map ((* f) . fromIntegral) [1..n]

klg :: UGen -> Int -> IO UGen
klg m u = do
    n <- rrand 4 u
    d <- iRand 9 12
    f <- iRand m (m + 2)
    l <- sequence (replicate n (U.rand 0.01 0.02))
    p <- U.rand (-1.0) 1.0
    let a = 0.5
        e = envGen KR 1 0.9 0 1 RemoveSynth (envSine d a)
        nh = nharm n (midiCPS f)
        s = klangSpec nh l (replicate n 0.0)
    return (pan2 (klang AR 1 0 s) p e)

ply :: Int -> (Double,Double) -> UGen -> Int -> IO ()
ply n (l,r) m u = do
  let a = do pauseThread =<< rrand l r
             audition . out 0 =<< klg m u
  replicateM_ n a

main :: IO ()
main = do
  _ <- forkIO (ply 32 (0.25,0.75) 92 24)
  _ <- forkIO (ply 8 (1.25,1.75) 12 54)
  return ()
