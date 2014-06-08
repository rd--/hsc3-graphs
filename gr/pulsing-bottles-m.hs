-- pulsing bottles (jmcc) #2

import Control.Monad {- base -}
import Sound.SC3.Monad {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

pulsing_bottles :: UId m => m UGen
pulsing_bottles = do
  let r = do n <- whiteNoise AR
             r0 <- rand 4 14
             r1 <- rand 0 0.7
             r2 <- rand 400 7400
             return (resonz (n * lfPulse KR r0 0 0.25 * r1) r2 0.01)
      s = do f <- rand 0.1 0.5
             p <- rand 0 (pi * 2)
             return (sinOsc KR f p)
      u = liftM2 (\x y -> pan2 x y 1) r s
  fmap sum (sequence (replicate 6 u))

main :: IO ()
main = overlapTextureU (4,4,4,maxBound) =<< pulsing_bottles
