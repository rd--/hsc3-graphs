-- slow beating sines (jmcc) #7

import Control.Monad {- base -}
import qualified Control.Monad.Random as R {- MonadRandom -}

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.Monad as R {- hsc3-lang -}

r_freq :: (R.RandomGen g) => Int -> R.Rand g [Double]
r_freq i = do
  n <- R.nrrand i 24 84
  return (map midi_to_cps n)

r_harmonics :: (R.RandomGen g) => Double -> Int -> Double -> R.Rand g [Double]
r_harmonics d m f = fmap (map (+ f)) (R.nrand2 m d)

r_harmonics' :: (R.RandomGen g) => Double -> Int -> Double -> R.Rand g [Double]
r_harmonics' d m f = fmap ((f :)  . map (+ f)) (R.nrand2 (m - 1) d)

r_phase :: (R.RandomGen g) => Int -> R.Rand g [Double]
r_phase m = R.nrrand m 0 (2 * pi)

-- > g <- fmap (fst . runRand (sbs 3 0.4 3)) getStdGen
sbs :: (R.RandomGen g) => Int -> Double -> Int -> R.Rand g UGen
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
  g <- R.getStdGen
  O.overlapTextureS (4,4,3,maxBound) (R.runRand (sbs 20 0.4 3)) g
