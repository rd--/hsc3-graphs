-- hell is busy (jmcc) #1

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

hib :: UGen
hib =
    let o = fSinOsc AR (400 + rand 'α' 0 2000) 0
        a = lfPulse KR (1 + rand 'β' 0 10.0) (rand 'γ' 0 0.7) 0.04
    in pan2 (o * a) (rand 'δ' (-1) 1) 1

main :: IO ()
main = overlapTextureU (4,4,8,maxBound) hib
