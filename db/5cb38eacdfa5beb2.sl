{- http://sccode.org/1-4Qy (F0) ; 0289 -}
let b = 1:50;
let t = Impulse(b / 49, 0);
let o = SinOscFb(33 * b, LagUd(t, 0.005, 0.2) * 99) * LagUd(t, 0.007, 1);
GVerb(o.Sum, 299, 9, 0.01, 0.5, 6, 1, 1, 1, 300) * 0.1
