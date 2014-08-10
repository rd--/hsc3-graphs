-- zizle (jmcc) #SC3d1.5
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

twopi :: Floating n => n
twopi = 2 * pi

rand2 :: UId m => UGen -> m UGen
rand2 n = randM (-n) n

-- Sound.SC3.UGen.Dot.draw =<< zizle
-- audition =<< zizle
zizle :: UId m => m UGen
zizle = do
  let a f = mix (sinOsc AR (f * mce2 #(randM 0.7 1.3) 1) (mce2 #(randM 0 twopi) #(randM 0 twopi)) * 0.1)
  let a1 = max (a #(expRandM 0.3 8)) 0
  let a2 = abs (a #(expRandM 6 24))
  let o = sinOsc AR (midiCPS #(randM 24 108)) #(randM 0 twopi)
  return (pan2 (o * a1 * a2) #(rand2 1) 1)

main :: IO ()
main = overlapTextureU (4,4,12,maxBound) =<< zizle
