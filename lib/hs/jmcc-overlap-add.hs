-- overlap-add (jmcc)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

sine :: UGen
sine =
    let r0 = expRand 'α' 500 1400
        r1 = rand 'β' (-1) 1
    in pan2 (sinOsc AR r0 0) r1 0.01

noise :: UGen
noise =
    let n0 = whiteNoise 'γ' AR
        r0 = expRand 'δ' 800 8400
        r1 = rand 'ε' (-1) 1
    in pan2 (resonz (n0 * 0.1) r0 0.05) r1 0.25

sc :: NRT
sc = nrt_merge
     (overlapTexture_nrt (1,0) (4,4,6,maxBound) sine)
     (overlapTexture_nrt (1,0) (4,4,6,maxBound) noise)

main :: IO ()
main = nrt_audition sc
