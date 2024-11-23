/* http://sccode.org/1-4Qy (F0) ; 0295 */
let o = SinOsc([600, 500, 99, 50, 8 / 3], 0) * SinOsc(0.1 / [9, 8, 7, 6, 5], 0);
let h = o.reduce(Hypot:/2) / 2;
AllpassC(Hpf(h, 9), 1, SinOsc(1 / [80, 90], 0) / 3 + 0.5, 5)
