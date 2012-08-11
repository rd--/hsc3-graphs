-- chrd-t (rd)

import Control.Monad {- base -}
import Control.Monad.Random {- MonadRandom -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import Sound.SC3.Lang.Random.Monad

chrd :: RandomGen g => [Int] -> Double -> Rand g UGen
chrd ch ds = do
  r0 <- rrand 0.05 0.5
  r1 <- rrand (-1) 1
  r2 <- rrand (-1) 1
  r3 <- rrand 0.15 0.35
  r4 <- rrand 0.005 0.01
  let m = mce (map fromIntegral ch)
      d = mce (map (* constant ds) [5, 4, 5, 7, 4, 5])
      f = midiCPS (xLine KR m (m + r0) d DoNothing)
      z = envTrapezoid 0 r3 d r4
      e = envGen KR 1 1 0 1 DoNothing z
      p = xLine KR r1 r2 d DoNothing
      o = fSinOsc AR f 0
  return (mix (pan2 o p e))

chrdN :: RandomGen g => Int -> Int -> Double -> Rand g UGen
chrdN i j ds = do
  let scale = [0,2,4,5,7,9,11]
      octaves = [4,5,6,7]
  ch <- nchoose i [n + (o * 12) | n <- scale, o <- octaves]
  c <- replicateM j (chrd ch ds)
  return (sum c)

main :: IO ()
main = do
  g <- getStdGen
  overlapTextureS (21,0,3,maxBound) (runRand (chrdN 6 9 3)) g
