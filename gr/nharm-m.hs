-- nharm (rd)

import Control.Concurrent {- base -}
import Control.Monad
import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Random.IO {- hsc3-lang -}

nharm :: (Num b, Integral a) => a -> b -> [b]
nharm n f = map ((* f) . fromIntegral) [1..n]

klg :: UId m => UGen -> Int -> m UGen
klg m u = do
    n <- rrand 4 u
    d <- iRandM 9 12
    f <- iRandM m (m + 2)
    l <- sequence (replicate n (randM 0.01 0.02))
    p <- randM (-1.0) 1.0
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
