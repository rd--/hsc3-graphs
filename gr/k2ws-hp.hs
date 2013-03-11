{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}
-- https://www.listarc.bham.ac.uk/lists/sc-users/msg21341.html (mn)

import Sound.SC3.Monad {- hsc3 -}

k2ws :: UId m => m UGen
k2ws = do
  let fc = 400 + range 100 200 #(lfNoise2 AR (mce2 1 2))
  let fm = range 100 200 #(lfNoise0 AR 5)
  let i = range 1 20 #(lfNoise1 AR 10)
  let x = sinOsc AR (fc + (sinOsc AR fm 0 * i * fm)) 0 * 0.5
  let rf = range 1000 2000 (sinOsc AR (range 0.1 1 #(lfNoise1 AR 1)) 0)
  let rq = range 0.5 10 #(lfNoise1 AR 1)
  let ph = rlpf x rf rq * range 1.0 4.0 #(lfNoise1 AR 0.1) * 4 * pi
  return (sinOsc AR 0.2 ph * 0.5)

main :: IO ()
main = audition . out 0 =<< k2ws
