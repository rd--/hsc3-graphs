-- tremulate (jmcc)

import Sound.SC3.Monad
import Sound.SC3.Lang.Control.OverlapTexture

tremulate :: UId m => m UGen
tremulate = do
  f <- rand 500 900
  let o = fSinOsc AR (f * mce [1,1.2,1.5,1.8]) 0
  r <- rand 30 90
  n <- clone 4 (lfNoise2 KR r)
  let a = max 0 (n * 0.1)
  l <- clone 4 (rand (-1) 1)
  return (mix (pan2 o l a))

tremulate_pp :: UGen -> UGen
tremulate_pp i = combN i 0.1 0.1 1

main :: IO ()
main = do
  t <- tremulate
  xfadeTextureU_pp (0.5,2,maxBound) t 2 tremulate_pp

{-
audition . out 0 =<< tremulate
Sound.SC3.UGen.Dot.draw =<< tremulate
-}
