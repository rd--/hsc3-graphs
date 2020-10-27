-- https://www.listarc.bham.ac.uk/lists/sc-users/msg21341.html (mn)
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Sound.SC3 {- hsc3 -}

k2ws :: UId m => m UGen
k2ws = do
  let fc = 400 + range 100 200 #(lfNoise2M AR (mce2 1 2))
  let fm = range 100 200 #(lfNoise0M AR 5)
  let i = range 1 20 #(lfNoise1M AR 10)
  let x = sinOsc AR (fc + (sinOsc AR fm 0 * i * fm)) 0 * 0.5
  let rf = range 1000 2000 (sinOsc AR (range 0.1 1 #(lfNoise1M AR 1)) 0)
  let rq = range 0.5 10 #(lfNoise1M AR 1)
  let ph = rlpf x rf rq * range 1.0 4.0 #(lfNoise1M AR 0.1) * 4 * pi
  return (sinOsc AR 0.2 ph * 0.5)

main :: IO ()
main = audition . out 0 =<< k2ws
