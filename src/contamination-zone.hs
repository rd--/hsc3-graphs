-- contamination zone (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

cz :: UGen
cz =
    let f = expRand 'a' 800 8000
        p = let e = lfNoise1 'a' KR (rand 'a' 0 3) * 0.0008 + 0.0022
            in pinkNoise 'a' AR * e
        s = sinOsc KR (linRand 'a' 0 1 0) 0 * (0.7 * f) + f
        k = let sp = klankSpec (udup' 4 (rand 'a' 50 2000))
                               [1,1,1,1]
                               (udup' 4 (rand 'a' 0.2 4))
            in abs (klank p 1 0 1 sp) * iChoose 'a' (mce [-1,1])
        r = rlpf k s 0.1
        a = lfPulse KR (linRand 'a' 0 150 0) 0 (rand 'a' 0.2 0.4)
    in pan2 r (lfNoise1 'a' KR (rand 'a' 0 1)) a

cz_pp :: UGen -> UGen
cz_pp =
    let f x = allpassN x 0.04 (udup 2 (rand 'a' 0 0.04)) 16
    in useq 'a' 6 f

main :: IO ()
main = overlapTextureU_pp (8,3,4,maxBound) cz 2 cz_pp

{-
audition (out 0 cz)
audition (out 0 (cz_pp cz))
-}
