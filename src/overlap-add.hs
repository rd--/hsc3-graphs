-- overlap-add (jmcc, rd)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture
import Sound.SC3.Lang.Pattern.ID

sine :: UGen
sine =
    let r0 = expRand 'a' 500 1400
        r1 = rand 'b' (-1) 1
    in pan2 (sinOsc AR r0 0) r1 0.01

noise :: UGen
noise =
    let n0 = whiteNoise 'a' AR
        r0 = expRand 'b' 800 8400
        r1 = rand 'c' (-1) 1
    in pan2 (resonz (n0 * 0.1) r0 0.05) r1 0.25

main :: IO ()
main = do
  audition (ppar [overlapTextureU' (4,4,6,maxBound) sine
                 ,overlapTextureU' (4,4,6,maxBound) noise])
