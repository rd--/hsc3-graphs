-- ring modulated klank (jmcc) #2

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.External.RDU.ID {- sc3-rdu -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

rmk :: UGen
rmk =
    let p = 8
        k = let sp = klankSpec_mce (randN p 'α' 100 10000)
                                   (mce (replicate p 1))
                                   (randN p 'α' 0.2 1)
            in klank (dust 'α' AR 20 * 0.02) 1 0 1 sp
        f = lfNoise2 'α' KR (rand 'α' 0.1 0.4) * 200 + rand 'α' 350 400
    in pan2 (sinOsc AR f 0 * k) (rand 'α' (-1) 1) 1

main :: IO ()
main = overlapTextureU (4,4,4,maxBound) rmk

{-
audition (out 0 rmk)
-}
