// analog bubbles (jmcc) #1

f = {var o = LFSaw.kr([8,7.23],0) * 3 + 80
    ;var f = LFSaw.kr(0.4,0) * 24 + o /* glissando function */
    ;var s = SinOsc.ar(f.midicps,0) * 0.04
    ;CombN.ar(s,0.2,0.2,4) * 0.1}; /* echoing sine wave */

z = f.play;
z.trace;

"mk.scd".loadRelative;
~wr_scsyndef.("analog-bubbles.sc",f);

{var f = LFSaw.kr(0.4, 0, 24, LFSaw.kr([8,7.23], 0, 3, 80)).midicps // glissando function
;CombN.ar(SinOsc.ar(f, 0, 0.04), 0.2, 0.2, 4) // echoing sine wave
}.play
