-- http://create.ucsb.edu/pipermail/sc-users/2004-April/009692.html (jmcc)

import Control.Monad {- base -}
import Sound.SC3.Monad {- hsc3 -}

pling :: UId m => m UGen
pling = do
  d <- dust AR 0.2
  f <- expRand 300 2200
  p <- rand (-1) 1
  let s1 = cubed (fSinOsc AR f 0)
      s2 = decay2 d 0.1 0.5 * 0.1 * s1
  return (pan2 s2 p 1)

bang :: UId m => m UGen
bang = do
  d <- dust AR 0.01
  n <- brownNoise AR
  return (pan2 (decay2 d 0.04 0.3 * n) 0 1)

chain :: Monad m => Int -> (b -> m b) -> b -> m b
chain n f = foldl (>=>) return (replicate n f)

r_allpass :: UId m => UGen -> m UGen
r_allpass i = do
  r <- clone 2 (rand 0.005 0.02)
  return (allpassN i 0.03 r 1)

tank_f :: UId m => UGen -> m UGen
tank_f i = do
  r1 <- clone 2 (rand 0.01 0.05)
  r2 <- clone 2 (rand 0.03 0.15)
  let l0 = localIn 2 AR * 0.98
      l1 = onePole l0 0.33
      [l1l,l1r] = mceChannels l1
      l2 = rotate2 l1l l1r 0.23
      l3 = allpassN l2 0.05 r1 2
      l4 = delayN l3 0.3 (mce [0.17,0.23])
      l5 = allpassN l4 0.05 r2 2
      l6 = leakDC l5 0.995
      l7 = l6 + i
  return (mrg [l7,localOut l7])

tank :: UId m => m UGen
tank = do
  s <- liftM2 (+) bang (mixFillM 8 (const pling))
  s' <- chain 4 r_allpass s
  tank_f s'

main :: IO ()
main = do
  t <- tank
  audition (out 0 t)
