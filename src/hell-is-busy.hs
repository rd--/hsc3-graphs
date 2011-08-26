-- hell is busy (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

hib :: UGen
hib =
    let o = fSinOsc AR (400 + rand 'a' 0 2000) 0
        a = lfPulse KR (1 + rand 'b' 0 10.0) (rand 'c' 0 0.7) 0.04
    in pan2 (o * a) (rand 'd' (-1) 1) 1

main :: IO ()
main = overlapTextureU (4,4,8,maxBound) hib

{-
var o = FSinOsc.ar(400+2000.0.rand,LFPulse.kr(1+10.0.rand,0.7.rand,0.04));
{OverlapTexture.ar({Pan2.ar(o,1.0.rand2)},4,4,8,2)}.play
-}
