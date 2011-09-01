-- wind metals (jmcc)

import Sound.SC3.Lang.Control.OverlapTexture
import Sound.SC3.Monadic

wind_metals :: UId m => m UGen
wind_metals = do
  let n = 6
  base <- expRand 60 4000
  rng <- rand 500 8000
  n0 <- clone 2 (brownNoise AR)
  r0 <- expRand 0.125 0.5
  n1 <- lfNoise1 KR r0
  f <- sequence (replicate n (rand base (base + rng)))
  dt <- sequence (replicate n (rand 0.1 2))
  let exc = n0 * 0.007 * max 0 (n1 * 0.75 + 0.25)
      k = klankSpec f (replicate n 1) dt
      s = klank exc 1 0 1 k
  return (softClip (s * 0.1))

main :: IO ()
main = overlapTextureU (2,5,12,maxBound) =<< wind_metals

{-
audition . out 0 =<< wind_metals
-}
