-- pond life (jmcc) #1

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

pond_life :: UId m => m UGen
pond_life = do
  n0 <- randM 0 30
  let f0 = 20 + n0
  n1 <- randM 100 400
  n2 <- linRandM 500 2500 0
  let f1 = fSinOsc KR f0 0 * n1 + n2
  n3 <- randM 1 9
  n4 <- randM 0.2 0.5
  let a = lfPulse KR (3 / n3) 0 n4 * 0.04
  n5 <- randM (-1) 1
  return (pan2 (sinOsc AR f1 0 * a) n5 0.5)

main :: IO ()
main = overlapTextureU (8,8,4,maxBound) =<< pond_life
