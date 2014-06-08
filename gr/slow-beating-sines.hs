-- slow beating sines (jmcc) #7

import Control.Monad {- base -}
import Control.Monad.Random {- MonadRandom -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import Sound.SC3.Lang.Random.Monad

r_freq :: (RandomGen g) => Int -> Rand g [Double]
r_freq i = do
  n <- nrrand i 24 84
  return (map midiCPS' n)

r_harmonics :: (RandomGen g) => Double -> Int -> Double -> Rand g [Double]
r_harmonics d m f = fmap (map (+ f)) (nrand2 m d)

r_harmonics' :: (RandomGen g) => Double -> Int -> Double -> Rand g [Double]
r_harmonics' d m f = fmap ((f :)  . map (+ f)) (nrand2 (m - 1) d)

r_phase :: (RandomGen g) => Int -> Rand g [Double]
r_phase m = nrrand m 0 (2 * pi)

sbs :: (RandomGen g) => Int -> Double -> Int -> Rand g UGen
sbs n d m = do
  f <- r_freq n
  p_fr <- mapM (r_harmonics' d m) f
  q_fr <- mapM (r_harmonics d m) f
  p_ph <- replicateM n (r_phase m)
  q_ph <- replicateM n (r_phase m)
  let a = replicate n (replicate m 1)
      p_sp = zipWith3 klangSpec' p_fr a p_ph
      q_sp = zipWith3 klangSpec' q_fr a q_ph
      mk_u s = klang AR 1 0 s * (0.1 / fromIntegral n)
      p_u = sum (map mk_u p_sp)
      q_u = sum (map mk_u q_sp)
  return (mce2 p_u q_u)

main :: IO ()
main = do
  g <- getStdGen
  overlapTextureS (4,4,3,maxBound) (runRand (sbs 20 0.4 3)) g
