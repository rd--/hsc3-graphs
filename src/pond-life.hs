-- pond life (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Events.OverlapTexture

pond_life :: UGen
pond_life =
    let f0 = 20 + rand 'a' 0 30
        f1 = fSinOsc KR f0 0 * rand 'b' 100 400 + linRand 'c' 500 2500 0
        a = lfPulse KR (3 / rand 'd' 1 9) (rand 'e' 0.2 0.5) 0.04
    in pan2 (sinOsc AR f1 0 * a) (rand 'f' (-1) 1) 0.5

main :: IO ()
main = overlapTextureU (8,8,4,maxBound) pond_life

{-
var f = FSinOsc.kr(20+30.0.rand,100+300.0.rand,500 + 2000.0.linrand);
var o = SinOsc.ar(f,0,LFPulse.kr(3/(1 + 8.0.rand),0.2+0.3.rand,0.04));
OverlapTexture.ar({Pan2.ar(o,1.0.rand2)},8,8,4,2)
-}
