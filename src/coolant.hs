-- coolant (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

coolant :: UGen
coolant =
    let p = 20
        s = onePole (uclone 'a' p (brownNoise 'a' AR) * 0.0015) 0.95
        n = replicate p 1
        sp = mce [klankSpec (uclone' 'a' p (rand 'a' 40 2400)) n n
                 ,klankSpec (uclone' 'b' p (rand 'b' 40 2400)) n n]
    in klank s 1 0 1 (mceTranspose sp)

main :: IO ()
main = xfadeTextureU (4,4,maxBound) coolant

{-
audition (out 0 coolant)
Sound.SC3.UGen.Dot.draw (out 0 coolant)
-}
