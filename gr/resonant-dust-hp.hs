{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}
-- resonant dust (jmcc)

import Sound.SC3.Monad {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

resonant_dust :: UId m => m UGen
resonant_dust = do
  st <- rand 80 2080
  let en = st + (st * #(rand (-0.5) 0.5))
      rf = xLine KR st en 9 DoNothing
  return (pan2 (resonz (0.3 * #(dust AR #(rand 50 850))) rf 0.1) #(rand (-1) 1) 1)

main :: IO ()
main = overlapTextureU (5,2,9,maxBound) =<< resonant_dust
