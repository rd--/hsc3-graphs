-- default (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Pattern.List

defaultInstrument :: Synthdef
defaultInstrument =
    let f = control KR "freq" 440
        a = control KR "amp" 0.1
        p = control KR "pan" 0
        g = control KR "gate" 1
        e = linen g 0.01 0.7 0.3 RemoveSynth
        f3 = mce [f,f + rand 'a' (-0.4) 0,f + rand 'b' 0 0.4]
        l = xLine KR (rand 'c' 4000 5000) (rand 'd' 2500 3200) 1 DoNothing
        z = lpf (mix (varSaw AR f3 0 0.3 * 0.3)) l * e
    in synthdef "default" (out 0 (pan2 z p a))

main :: IO ()
main = audition (defaultInstrument
                ,pbind [("note",pxrand 'a' [0,1,5,7,9] inf)
                       ,("octave",prand 'b' [3,4,5,6] inf)
                       ,("dur",pwrand 'c' [0.1,0.2,0.4] [0.5,0.4,0.1] inf)
                       ,("amp",pbrown 'd' 0.01 0.2 0.01 inf)
                       ,("pan",pbrown 'e' (-1) 1 0.25 inf)])

{-
SynthDef(\default, {
arg out=0,freq=440,amp=0.1,pan=0,gate=1;
var e = Linen.kr(gate, 0.01, 0.7, 0.3, 2);
var f3 = freq + [0, Rand(-0.4,0.0), Rand(0.0,0.4)];
var l = XLine.kr(Rand(4000,5000), Rand(2500,3200), 1);
var z = LPF.ar(Mix.new(VarSaw.ar(f3, 0, 0.3, 0.3)),l) * e;
OffsetOut.ar(out, Pan2.ar(z, pan, amp));
},[\ir]).add;
-}
