-- random sine waves (jmcc) #1
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

main :: IO ()
main = do
  let rsw = pan2 (fSinOsc AR #(randM 0 2000) 0 * 0.02) #(randM (-1) 1) 1
  overlapTextureU (2,5,12,maxBound) rsw
