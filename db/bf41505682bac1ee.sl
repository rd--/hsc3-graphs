{- http://sccode.org/1-4Qy (F0) ; 0270 -}
let d = InFb(1, 0);
let f = 1 / [9, 8.9];
let c = Lag(Amplitude(d, 0.01, 0.01) < SinOscFb(f, 0), f / 9) + d;
AllpassN(SinOscFb(98.5 + c, d + f) * c, 1, f * 3, 20).Tanh
