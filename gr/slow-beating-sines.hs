-- slow beating sines (jmcc) #7

import Control.Monad {- base -}

import qualified System.Random as R {- random -}
import qualified Control.Monad.Random as MR {- MonadRandom -}

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.Monad as MR {- hsc3-lang -}

-- > MR.evalRand (sbs_r_param 20 0.4 3) (R.mkStdGen 121423)
type SBS_PARAM n = (([[n]], [[n]], [[n]]), ([[n]], [[n]], [[n]]))

sbs_r_param :: R.RandomGen g => Int -> Double -> Int -> MR.Rand g (SBS_PARAM Double)
sbs_r_param n d m = do
  let gen_hm k f = MR.nrrand k (f - d) (f + d)
      gen_hm' k f = fmap (f :) (gen_hm k f)
      gen_ph = MR.nrrand m 0 (2 * pi)
  f <- MR.nrrand n (midi_to_cps 24) (midi_to_cps 84)
  p_fr <- mapM (gen_hm' (m - 1)) f
  q_fr <- mapM (gen_hm m) f
  p_ph <- replicateM n gen_ph
  q_ph <- replicateM n gen_ph
  let a = replicate n (replicate m 1)
  return ((p_fr,a,p_ph),(q_fr,a,q_ph))

sbs_r :: R.RandomGen g => Int -> Double -> Int -> MR.Rand g UGen
sbs_r n d m = do
  ((p_fr,p_am,p_ph),(q_fr,q_am,q_ph)) <- sbs_r_param n d m
  let p_sp = zipWith3 klangSpec_k p_fr p_am p_ph
      q_sp = zipWith3 klangSpec_k q_fr q_am q_ph
      mk_u s = klang AR 1 0 s * (0.1 / fromIntegral n)
      p_u = sum (map mk_u p_sp)
      q_u = sum (map mk_u q_sp)
  return (mce2 p_u q_u)

sbs_ot :: IO ()
sbs_ot = do
  g <- R.getStdGen
  O.overlapTextureS (4,4,3,maxBound) (MR.runRand (sbs_r 20 0.4 3)) g

sbs :: UGen
sbs = MR.evalRand (sbs_r 20 0.4 3) (R.mkStdGen 123678141)

main :: IO ()
main = sbs_ot
