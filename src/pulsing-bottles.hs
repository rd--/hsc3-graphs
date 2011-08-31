-- pulsing bottles (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

pulsing_bottles :: UGen
pulsing_bottles =
    let r = let n = whiteNoise 'a' AR
                r0 = rand 'a' 4 14
                r1 = rand 'a' 0 0.7
                r2 = rand 'a' 400 7400
            in resonz (n * lfPulse KR r0 0 0.25 * r1) r2 0.01
        s = let f = rand 'b' 0.1 0.5
                p = rand 'b' 0 (pi * 2)
             in sinOsc KR f p
    in sum (zipWith3 pan2 (upar' 'a' 6 r) (upar' 'b' 6 s) (repeat 1))

main :: IO ()
main = overlapTextureU (4,4,4,maxBound) pulsing_bottles

{-
audition (out 0 pulsing_bottles)
-}
