-- overlap-add (jmcc)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Pattern {- hsc3-lang -}

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

main :: IO ()
main = paudition (ppar [overlapTextureP (4,4,6,maxBound) sine
                       ,overlapTextureP (4,4,6,maxBound) noise])
