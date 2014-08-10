-- uplink (jmcc) #2
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Common.Monad.Syntax {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

uplink :: UId m => m UGen
uplink = do
  let p0 = do return (lfPulse KR #(randM 0 20) 0 #(randM 0 1))
  let p1 = do return (lfPulse KR #(randM 0 4) 0 #(randM 0 1)
                      * #(randM 0 8000)
                      + #(randM 0 2000))
  f <- fmap mix (clone 2 (p0 .*. p1))
  return (pan2 (lfPulse AR f 0 0.5 * 0.04) #(randM (-0.8) 0.8) 1)

main :: IO ()
main = overlapTextureU (4,1,5,maxBound) =<< uplink
