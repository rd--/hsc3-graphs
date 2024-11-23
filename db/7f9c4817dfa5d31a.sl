/* Tw 0077 (F0) - http://sccode.org/1-4Qy */
let f = SinOsc(1 / [5 6], 0) + [798 912];
let p = SinOsc(1 / 16, 0) * 19 + 99 * SinOsc([9 8], 0);
let m = SinOsc(SinOsc(6, 0) * SinOsc(0.009, 0), 0);
let b = SinOsc(f, p) * m;
SinOsc([201 301], b).Tanh * 0.25
