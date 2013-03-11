{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}
-- http://create.ucsb.edu/pipermail/sc-users/2004-April/009692.html (jmcc)

import Control.Monad {- base -}
import Sound.SC3.Monad {- hsc3 -}
import Sound.SC3.UGen.Monad.Syntax {- hsc3 -}

pling :: UId m => m UGen
pling = do
  let s = decay2 #(dust AR 0.2) 0.1 0.5 * 0.1 * cubed (fSinOsc AR #(expRand 300 2200) 0)
  return (pan2 s #(rand (-1) 1) 1)

bang :: UId m => m UGen
bang = do
  return (pan2 (decay2 #(dust AR 0.01) 0.04 0.3 * #(brownNoise AR)) 0 1)

chain :: Monad m => Int -> (b -> m b) -> b -> m b
chain n f = foldl (>=>) return (replicate n f)

r_allpass :: UId m => UGen -> m UGen
r_allpass i = do
  return (allpassN i 0.03 #(clone 2 (rand 0.005 0.02)) 1)

tank_f :: UId m => UGen -> m UGen
tank_f i = do
  let [l,r] = mceChannels (onePole (localIn 2 AR * 0.98) 0.33)
  let a = allpassN (rotate2 l r 0.23) 0.05 #(clone 2 (rand 0.01 0.05)) 2
      b = delayN a 0.3 (mce [0.17,0.23])
  let c = leakDC (allpassN b 0.05 #(clone 2 (rand 0.03 0.15)) 2) 0.995 + i
  return (mrg [c,localOut c])

tank :: UId m => m UGen
tank = do
  s <- bang .+. mixFillM 8 (const pling)
  s' <- chain 4 r_allpass s
  tank_f s'

main :: IO ()
main = do
  t <- tank
  audition (out 0 t)
