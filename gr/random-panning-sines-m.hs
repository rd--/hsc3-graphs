-- random panning sines (jmcc) #4

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

rps :: UId m => m UGen
rps = do
  let nd = do r0 <- linRandM 80 2000 0
              let o = fSinOsc AR r0 0
              l <- lfNoise1M KR =<< randM 0.8 1.2
              a <- lfNoise1M KR =<< randM 0.82 0.98
              return (pan2 o l a)
  r <- clone 8 nd
  return (mix r * (0.4 / 8))

main :: IO ()
main = overlapTextureU (8,8,2,maxBound) =<< rps
