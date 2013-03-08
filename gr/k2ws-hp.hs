{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}
-- https://www.listarc.bham.ac.uk/lists/sc-users/msg21341.html (mn)

import Sound.SC3.Monad {- hsc3 -}

rng :: (UGen,UGen) -> UGen -> UGen
rng (i,j) = range i j

k2ws :: UId m => m UGen
k2ws = do
  let xp = mce2 1 2
  let fc = 400 + rng (100,200) #(lfNoise2 AR xp)
  let fm = rng (100,200) #(lfNoise0 AR 5)
  let i = rng (1,20) #(lfNoise1 AR 10)
  let x = sinOsc AR (fc + (sinOsc AR fm 0 * i * fm)) 0 * 0.5
  let rf = rng (1000,2000) (sinOsc AR (rng (0.1,1) #(lfNoise1 AR 1)) 0)
  let rq = rng (0.5,10) #(lfNoise1 AR 1)
  let a = rlpf x rf rq
  let ph = a * rng (1.0,4.0) #(lfNoise1 AR 0.1) * 4 * pi
  return (sinOsc AR 0.2 ph * 0.5)

main :: IO ()
main = audition . out 0 =<< k2ws
