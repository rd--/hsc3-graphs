{- http://sccode.org/1-4Qy (F0) ; 0309 -}
let b = 1:9;
let c = SinOscFb(SinOscFb(SinOscFb(99 / b, 1), 1 / b) + b * 50, 1);
GVerb((FreqShift(c, 1 / b, 0) + c).mean / 3, 200, 3, 0.5, 0.5, 9, 1, 0.7, 1, 300)
