-- cricket (rd)

import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import Sound.SC3.Monad {- hsc3 -}

cricket :: UId m => m UGen
cricket = do
  r1 <- clone 2 (rand 10 13)
  r2 <- clone 2 (rand 10 13)
  r3 <- clone 2 (rand 4 7)
  let t = impulse KR 0.7 0
      e = decay2 (impulse KR r1 0) 0.001 0.005
      f = sinOsc KR r2 0 * e * r3
  r4 <- clone 2 (tRand 2130 2230 t)
  return (sinOsc AR r4 0 * f * 0.25)

main :: IO ()
main = overlapTextureU (7,2,3,maxBound) =<< cricket

{-
audition . out 0 =<< cricket
-}
