-- pulsing bottles (jmcc) #2

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.Protect
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

pulsing_bottles :: UGen
pulsing_bottles =
    let r = let n = whiteNoise 'α' AR
                r0 = rand 'α' 4 14
                r1 = rand 'α' 0 0.7
                r2 = rand 'α' 400 7400
            in resonz (n * lfPulse KR r0 0 0.25 * r1) r2 0.01
        s = let f = rand 'β' 0.1 0.5
                p = rand 'β' 0 (pi * 2)
             in sinOsc KR f p
    in sum (zipWith3 pan2 (uclone' 'α' 6 r) (uclone' 'β' 6 s) (repeat 1))

main :: IO ()
main = overlapTextureU (4,4,4,maxBound) pulsing_bottles

{-
audition (out 0 pulsing_bottles)
-}
