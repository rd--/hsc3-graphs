// analog bubbles (jmcc) #1
{var o = LFSaw.kr([8,7.23],0) * 3 + 80
;var f = LFSaw.kr(0.4,0) * 24 + o /* glissando function */
;var s = SinOsc.ar(f.midicps,0) * 0.04
;CombN.ar(s,0.2,0.2,4) * 0.1}.play /* echoing sine wave */
