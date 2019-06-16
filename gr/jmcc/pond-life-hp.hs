-- pond life (jmcc) #1
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

pond_life :: UId m => m UGen
pond_life = do
  let f0 = 20 + #(randM 0 30)
  let f1 = fSinOsc KR f0 0 * #(randM 100 400) + #(linRandM 500 2500 0)
  let a = lfPulse KR (3 / #(randM 1 9)) 0 #(randM 0.2 0.5) * 0.04
  return (pan2 (sinOsc AR f1 0 * a) #(randM (-1) 1) 0.5)

main :: IO ()
main = overlapTextureU (8,8,4,maxBound) =<< pond_life
