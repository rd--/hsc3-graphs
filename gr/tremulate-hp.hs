-- tremulate (jmcc)
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}

tremulate :: UId m => m UGen
tremulate = do
  let o = fSinOsc AR (#(randM 500 900) * mce [1,1.2,1.5,1.8]) 0
  n <- clone 4 (lfNoise2M KR #(randM 30 90))
  return (mix (pan2 o #(clone 4 (randM (-1) 1)) (max 0 (n * 0.1))))

tremulate_pp :: UGen -> UGen
tremulate_pp i = combN i 0.1 0.1 1

main :: IO ()
main = do O.xfadeTextureU_pp (0.5,2,maxBound) #(tremulate) 2 tremulate_pp
