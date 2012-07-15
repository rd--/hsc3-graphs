-- hell is busy (jmcc)

import Sound.SC3.ID {- hcs3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

hib :: UGen
hib =
    let o = fSinOsc AR (400 + rand 'a' 0 2000) 0
        a = lfPulse KR (1 + rand 'b' 0 10.0) (rand 'c' 0 0.7) 0.04
    in pan2 (o * a) (rand 'd' (-1) 1) 1

main :: IO ()
main = overlapTextureU (4,4,8,maxBound) hib
