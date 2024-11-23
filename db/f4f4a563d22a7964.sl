/* Tw 0125 (F0) */
let f = SinOsc(1 / [8, 9], 0) * 4 + [400, 202];
let u = SinOsc(1 / 9, 0) + 1 / 88;
let d = SinOsc(1 / 8, 0) + 1 / 99;
let i = InFb(1, [1, 0]);
let p = CombC(i.LagUd(u, d), 1, 0.08, 9);
SinOsc(f, p) * 0.25
