-- random sine waves (jmcc)
{-# OPTIONS_GHC -F -pgmF she #-}

import Control.Applicative {- base -}
import Sound.SC3.Monad {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

main :: IO ()
main = do
  s <- (|pan2 ((|fSinOsc ~AR (rand 0 2000) ~0|) .* 0.02) (rand (-1) 1) ~1|)
  overlapTextureU (2,5,12,maxBound) s
