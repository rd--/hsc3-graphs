-- wind metals (jmcc)

import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import Sound.SC3 {- hsc3 -}

-- > audition . out 0 =<< wind_metals
wind_metals :: UId m => m UGen
wind_metals = do
  let n = 6
  base <- expRandM 60 4000
  rng <- randM 500 8000
  n0 <- clone 2 (brownNoiseM AR)
  r0 <- expRandM 0.125 0.5
  n1 <- lfNoise1M KR r0
  f <- sequence (replicate n (randM base (base + rng)))
  dt <- sequence (replicate n (randM 0.1 2))
  let exc = n0 * 0.007 * max 0 (n1 * 0.75 + 0.25)
      k = klankSpec f (replicate n 1) dt
      s = klank exc 1 0 1 k
  return (softClip (s * 0.1))

main :: IO ()
main = overlapTextureU (5,2,12,maxBound) =<< wind_metals
