-- slow beating harmonic sines (jmcc) #7

import Control.Monad {- base -}

import qualified System.Random as R {- random -}
import qualified Control.Monad.Random as MR {- MonadRandom -}

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.Monad as MR {- hsc3-lang -}

-- | slow beating harmonic sines (jmcc) #7
sbhs_r_freq :: R.RandomGen g => Int -> Int -> MR.Rand g [Double]
sbhs_r_freq k i = do
  n <- MR.nchoose i [0,2,4,5,7,9]
  o <- MR.nrand i 7
  let f n' o' = midi_to_cps (n' + (o' * 12) + fromIntegral k)
  return (zipWith f n o)

sbhs_r_harmonics :: R.RandomGen g => Double -> Int -> Double -> MR.Rand g [Double]
sbhs_r_harmonics d m f = do
  d' <- MR.nrand2 m d
  return (zipWith (+) (map (* f) [1,2,4,5,6]) d')

type SBHS_PARAM n = (([[n]], [[n]], [[n]]), ([[n]], [[n]], [[n]]))

sbhs_r_param :: R.RandomGen g => Int -> Double -> Int -> MR.Rand g (SBHS_PARAM Double)
sbhs_r_param n d m = do
  k' <- MR.rand 12
  let k = 24 + k'
      gen_ph = MR.nrrand m 0 (2 * pi)
  f <- sbhs_r_freq k n
  p_fr <- mapM (sbhs_r_harmonics d m) f
  q_fr <- mapM (sbhs_r_harmonics d m) f
  p_ph <- replicateM n gen_ph
  q_ph <- replicateM n gen_ph
  let a = replicate n (replicate m 1)
  return ((p_fr,a,p_ph),(q_fr,a,q_ph))

sbhs_r :: R.RandomGen g => Int -> Double -> Int -> MR.Rand g UGen
sbhs_r n d m = do
  ((p_fr,p_am,p_ph),(q_fr,q_am,q_ph)) <- sbhs_r_param n d m
  let p_sp = zipWith3 klangSpec_k p_fr p_am p_ph
      q_sp = zipWith3 klangSpec_k q_fr q_am q_ph
      mk_u s = klang AR 1 0 s * (0.1 / fromIntegral n)
      p_u = sum (map mk_u p_sp)
      q_u = sum (map mk_u q_sp)
  return (mce2 p_u q_u)

sbhs_ot :: IO ()
sbhs_ot = do
  g <- R.getStdGen
  O.overlapTextureS (3,6,3,maxBound) (MR.runRand (sbhs_r 8 0.4 5)) g

sbhs :: UGen
sbhs = MR.evalRand (sbhs_r 8 0.4 5) (R.mkStdGen 123678141)

main :: IO ()
main = sbhs_ot
