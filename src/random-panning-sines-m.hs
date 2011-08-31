-- random panning sines (jmcc)

import Sound.SC3.Monadic
import Sound.SC3.Lang.Control.OverlapTexture

rps :: UId m => m UGen
rps = do
  let nd = do r0 <- linRand 80 2000 0
              let o = fSinOsc AR r0 0
              l <- lfNoise1 KR =<< rand 0.8 1.2
              a <- lfNoise1 KR =<< rand 0.82 0.98
              return (pan2 o l a)
  r <- clone 8 nd
  return (mix r * (0.4 / 8))

main :: IO ()
main = overlapTextureU (8,8,2,maxBound) =<< rps

{-
audition . out 0 =<< rps
Sound.SC3.UGen.Dot.draw =<< rps
-}
