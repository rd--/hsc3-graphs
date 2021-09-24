// tw 0049 (f0)
{var o0 = LFSaw.ar(3, 0) * 9 + 99
;var s0 = Sweep.ar(0, 7.iota + 3) % o0
;var s1 = Sweep.ar(0, 31.iota * -1 + 33) % 128 & s0
;var o1 = SinOsc.ar((s1 + 33).midicps, 0) * pi
;Splay.ar(SinOsc.ar(9, o1)) / 3}
