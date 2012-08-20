-- coolant (jmcc)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.Protect
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

-- > Sound.SC3.UGen.Dot.draw coolant
coolant :: UGen
coolant =
    let p = 20
        s = onePole (uclone 'α' p (brownNoise 'α' AR) * 0.0015) 0.95
        n = replicate p 1
        sp = mce [klankSpec (uclone' 'α' p (rand 'α' 40 2400)) n n
                 ,klankSpec (uclone' 'β' p (rand 'β' 40 2400)) n n]
    in klank s 1 0 1 (mceTranspose sp)

main :: IO ()
main = xfadeTextureU (4,4,maxBound) coolant
