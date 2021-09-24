// tw 0121 (f0)
{var z = SinOsc.kr(1 / [8, 7], 0) * SinOsc.kr(1 / 30, 0) * 9
;var l = 8.iota * 6 + 56
;var m = SinOsc.ar(1 / [4, 3], 0)
;var o = SinOsc.ar(Select.kr(z, l).midicps, 0) * m
;CombN.ar(o, 1, 1 / [6, 5], 9).tanh * 0.2}
