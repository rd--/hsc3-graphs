-- coolant (jmcc) #2

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

coolant :: UGen
coolant =
    let p = 20
        s = onePole (uclone 'α' p (brownNoise 'β' AR) * 0.0015) 0.95
        n = replicate p 1
        sp = mce [klankSpec (uclone' 'γ' p (rand 'δ' 40 2400)) n n
                 ,klankSpec (uclone' 'ε' p (rand 'ζ' 40 2400)) n n]
    in klank s 1 0 1 (mceTranspose sp)

main :: IO ()
main = overlapTextureU (4,4,2,maxBound) coolant
