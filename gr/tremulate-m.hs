-- tremulate (jmcc) #1

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}

tremulate :: UId m => m UGen
tremulate = do
  f <- randM 500 900
  let o = fSinOsc AR (f * mce [1,1.2,1.5,1.8]) 0
  r <- randM 30 90
  n <- clone 4 (lfNoise2M KR r)
  let a = max 0 (n * 0.1)
  l <- clone 4 (randM (-1) 1)
  return (mix (pan2 o l a))

tremulate_pp :: UGen -> UGen
tremulate_pp i = combN i 0.1 0.1 1

main :: IO ()
main = do
  t <- tremulate
  O.xfadeTextureU_pp (0.5,2,maxBound) t 2 tremulate_pp
