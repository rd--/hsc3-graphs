{- http://sccode.org/1-4Qy (F0) ; 0290 -}
let b = [99, 98];
let c = SinOsc(12, 0);
let o = SinOsc(b, c) + (SinOsc(c > 0 * 8 * b, 0) * SinOsc(1 / b, 0));
(AllpassC(o, 1, SinOsc(1 / [3, 4], 0) % 1, 8) * SinOsc(1 / 64, [0, 1]) * 3).Sin * 0.5
