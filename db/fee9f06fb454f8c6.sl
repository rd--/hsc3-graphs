{- http://sccode.org/1-4Qy (F0) ; 0343 -}
let b = 0.01 / 2:6;
let c = SinOscFb(1 - b * 8, 1 / 2) + 1 / 2;
let e = Decay(c > 0.99512 * SinOscFb(c + 1 / b, 0), 1 / 2) / 22;
let o = SinOscFb(4 ^ SinOscFb(b, 0) * 99, c);
(o * e).Tanh.Splay
