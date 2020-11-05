-- chrd-t (rd)

import Control.Monad {- base -}
import Control.Monad.Random {- MonadRandom -}

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}
import qualified Sound.SC3.Lang.Random.Monad as R {- hsc3-lang -}

-- composite chord ugen graph (shared random values)
chrd :: RandomGen g => [Int] -> [Double] -> Rand g UGen
chrd mnn_i dur_r = do
  drift <- R.rrand 0.05 0.5
  loc1 <- R.rrand (-1) 1
  loc2 <- R.rrand (-1) 1
  skew <- R.rrand 0.15 0.35
  amp <- R.rrand 0.005 0.01
  let mnn = mce (map constant mnn_i)
      dur = mce (map constant dur_r)
      freq = midiCPS (xLine KR mnn (mnn + drift) dur DoNothing)
      env_data = envTrapezoid 0 skew dur amp
      env = envGen KR 1 1 0 1 DoNothing env_data
      loc = xLine KR loc1 loc2 dur DoNothing
      sig = fSinOsc AR freq 0
  return (mix (pan2 sig loc env))

-- single note ugen graph (distinct random values)
chrd1 :: RandomGen g => UGen -> UGen -> Rand g UGen
chrd1 mnn dur = do
  drift <- R.rrand 0.05 0.5
  loc1 <- R.rrand (-1) 1
  loc2 <- R.rrand (-1) 1
  skew <- R.rrand 0.15 0.35
  amp <- R.rrand 0.005 0.01
  let freq = midiCPS (xLine KR mnn (mnn + drift) dur DoNothing)
      env_data = envTrapezoid 0 skew dur amp
      env = envGen KR 1 1 0 1 DoNothing env_data
      loc = xLine KR loc1 loc2 dur DoNothing
      sig = fSinOsc AR freq 0
  return (pan2 sig loc env)

chrd' :: RandomGen g => [Int] -> [Double] -> Rand g UGen
chrd' mnn dur = do
  sig <- zipWithM chrd1 (map constant mnn) (map constant dur)
  return (sum sig)

chrdN :: RandomGen g => Int -> Int -> Double -> Rand g UGen
chrdN i j ds = do
  let scale = [0,2,4,5,7,9,11]
      octaves = [4,5,6,7]
      dur = [4,5,7]
  ch <- R.nchoose i [n + (o * 12) | n <- scale, o <- octaves]
  du <- R.nchoose i (map (* ds) dur)
  mk <- R.choose [chrd,chrd']
  c <- replicateM j (mk ch du)
  return (sum c)

main :: IO ()
main = do
  g <- getStdGen
  O.overlapTextureS (21,0,3,maxBound) (runRand (chrdN 6 9 3)) g
