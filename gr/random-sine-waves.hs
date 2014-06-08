-- random sine waves (jmcc) #1

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

rsw :: UGen
rsw =
    let f = rand 'α' 0 2000
        o = fSinOsc AR f 0 * 0.02
    in pan2 o (rand 'β' (-1) 1) 1

main :: IO ()
main = overlapTextureU (2,5,12,maxBound) rsw
