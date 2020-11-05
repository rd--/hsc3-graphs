-- resonant dust (jmcc) #2
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

resonant_dust :: UId m => m UGen
resonant_dust = do
  st <- randM 80 2080
  let en = st + (st * #(randM (-0.5) 0.5))
      rf = xLine KR st en 9 DoNothing
  return (pan2 (resonz (#(dustM AR #(randM 50 850)) * 0.3) rf 0.1) #(randM (-1) 1) 1)

main :: IO ()
main = overlapTextureU (5,2,9,maxBound) =<< resonant_dust
