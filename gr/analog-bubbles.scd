// alien meadow (jmcc)

{
    f = LFSaw.kr(0.4, 0, 24, LFSaw.kr([8,7.23], 0, 3, 80)).midicps; // glissando function
    CombN.ar(SinOsc.ar(f, 0, 0.04), 0.2, 0.2, 4) // echoing sine wave
}.play

{var o = LFSaw.kr([8,7.23],0) * 3 + 80
;var f = LFSaw.kr(0.4,0) * 24 + o
;var s = SinOsc.ar(f.midicps,0) * 0.04
;Out.ar(0,CombN.ar(s,0.2,0.2,4) * 0.1)}.play
