(* tw 0077 (f0) - http://sccode.org/1-4Qy *)
var f = SinOsc(1 / [5 6], 0) + [798 912];
var p = SinOsc(1 / 16, 0) * 19 + 99 * SinOsc([9 8], 0);
var m = SinOsc(SinOsc(6, 0) * SinOsc(0.009, 0), 0);
var b = SinOsc(f, p) * m;
SinOsc([201 301], b).Tanh * 0.25
