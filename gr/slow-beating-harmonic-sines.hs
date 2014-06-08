-- slow beating harmonic sines (jmcc) #7

import Control.Monad {- base -}
import Control.Monad.Random {- MonadRandom -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import Sound.SC3.Lang.Random.Monad

r_freq :: (RandomGen g) => Int -> Int -> Rand g [Double]
r_freq k i = do
  n <- nchoose i [0,2,4,5,7,9]
  o <- nrand i 7
  let f n' o' = midiCPS' (n' + (o' * 12) + fromIntegral k)
  return (zipWith f n o)

r_harmonics :: (RandomGen g) => Double -> Int -> Double -> Rand g [Double]
r_harmonics d m f = do
  d' <- nrand2 m d
  return (zipWith (+) (map (* f) [1,2,4,5,6]) d')

r_phase :: (RandomGen g) => Int -> Rand g [Double]
r_phase m = nrrand m 0 (2 * pi)

sbhs :: (RandomGen g) => Int -> Double -> Int -> Rand g UGen
sbhs n d m = do
  k' <- rand 12
  let k = 24 + k'
  f <- r_freq k n
  p_fr <- mapM (r_harmonics d m) f
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
  overlapTextureS (3,6,3,maxBound) (runRand (sbhs 8 0.4 5)) g
