-- random sine waves (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Events.OverlapTexture

rsw :: UGen
rsw =
    let f = rand 'a' 0 2000
        o = fSinOsc AR f 0 * 0.02
    in pan2 o (rand 'b' (-1) 1) 1

main :: IO ()
main = overlapTextureU (2,5,12,maxBound) rsw

{-
var e = Env.linen(2,5,2);
var o = FSinOsc.ar(2000.0.rand,EnvGen.kr(e,1,0,0.02));
play({Spawn.ar({Pan2.ar(o,1.0.rand2)},2,9/12)})
-}
