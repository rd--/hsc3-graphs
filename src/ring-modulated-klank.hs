-- ring modulated klank (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

rmk :: UGen
rmk =
    let p = 8
        k = let sp = klankSpec (udup' p (rand 'a' 100 10000))
                               (replicate p 1)
                               (udup' p (rand 'a' 0.2 1))
            in klank (dust 'a' AR 20 * 0.02) 1 0 1 sp
        f = lfNoise2 'a' KR (rand 'a' 0.1 0.4) * 200 + rand 'a' 350 400
    in pan2 (sinOsc AR f 0 * k) (rand 'a' (-1) 1) 1

main :: IO ()
main = overlapTextureU (4,4,4,maxBound) rmk

{-
audition (out 0 rmk)
-}
