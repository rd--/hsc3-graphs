-- pond life (jmcc) #1
{-# OPTIONS_GHC -F -pgmF hsc3-hash-at #-}

import Data.Hashable {- hashable -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

pond_life :: UGen
pond_life =
    let f0 = 20 + (rand #@ 0 30)
        f1 = fSinOsc KR f0 0 * (rand #@ 100 400) + (linRand #@ 500 2500 0)
        a = lfPulse KR (3 / (rand #@ 1 9)) (rand #@ 0.2 0.5) 0.04
    in pan2 (sinOsc AR f1 0 * a) (rand #@ (-1) 1) 0.5

main :: IO ()
main = overlapTextureU (8,8,4,maxBound) pond_life
