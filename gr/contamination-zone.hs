-- contamination zone (jmcc) #9

import Sound.SC3 {- hsc3 -}
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

cz :: UGen
cz =
    let f = expRand 'α' 800 8000
        p = let e = lfNoise1 'β' KR (rand 'γ' 0 3) * 0.0008 + 0.0022
            in pinkNoise 'δ' AR * e
        s = sinOsc KR (linRand 'ε' 0 1 0) 0 * (0.7 * f) + f
        k = let sp = klankSpec_mce (randN 4 'ζ' 50 2000)
                                   (mce [1,1,1,1])
                                   (randN 4 'η' 0.2 4)
            in abs (klank p 1 0 1 sp) * choose 'θ' (mce2 (-1) 1)
        r = rlpf k s 0.1
        a = lfPulse KR (linRand 'ι' 0 150 0) 0 (rand 'κ' 0.2 0.4)
    in pan2 r (lfNoise1 'λ' KR (rand 'μ' 0 1)) a

cz_pp :: UGen -> UGen
cz_pp =
    let f x = allpassN x 0.04 (randN 2 'ν' 0 0.04) 16
    in useq 'ξ' 6 f

main :: IO ()
main = overlapTextureU_pp (3,8,4,maxBound) cz 2 cz_pp

{-
audition (out 0 cz)
audition (out 0 (cz_pp cz))
-}
