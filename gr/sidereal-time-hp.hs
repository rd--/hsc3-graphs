-- sidereal time (jmcc)
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Control.Monad {- base -}
import Sound.SC3.Monad {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

sidereal_time :: UId m => m UGen
sidereal_time = do
  let p = 15
  z <- let y = do
             fr <- replicateM p (expRand 100 6000)
             rt <- replicateM p (rand 2 6)
             return (klankSpec fr (replicate p 1) rt)
       in clone 2 y
  let f = xLine KR #(expRand 40 300) #(expRand 40 300) 12 DoNothing
  let t = lfPulse AR f 0 #(rand 0.1 0.9)
          * max 0 #(lfNoise2 KR #(rand 0 8))
          * 0.002
      o = distort (klank t 1 0 1 (mceTranspose z)) * 0.1
  return (combN o 0.6 #(rand 0.1 0.6) 8 + mceReverse o)

main :: IO ()
main = overlapTextureU (4,4,6,maxBound) =<< sidereal_time

{-
audition (out 0 sidereal_time)
-}
