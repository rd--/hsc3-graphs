// f0 -- tweet0049
{var o0 = LFSaw.ar(3) * 9 + 99
;var s0 = Sweep.ar(0,(3..9)) % o0
;var s1 = Sweep.ar(0,(33..3)) % 128 & s0
;var o1 = SinOsc.ar(midicps(s1 + 33),0,pi)
;Splay.ar(SinOsc.ar(9,o1)) / 3}.play