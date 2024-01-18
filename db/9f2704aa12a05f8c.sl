{- http://sccode.org/1-Z (jl) ; edits (rd) -}
let t = 0.0025;
let a = Lag(Trig(Impulse(8, 0), t * 2), 0.1);
let b = Crackle(Lag(LfSaw(3, 0).Abs, 0.1) * 1.8);
let c = a * b;
let d = Lag(Trig(Impulse(2, 0) + Impulse(4, 0.5), t), 0.1);
let e = Blip(4.9, 7) * 0.4;
let f = d * e;
(c + GVerb(f, 1, 1, 0.5, 0.5, 15, 1, 0.7, 0.5, 300) * 5).Tanh * 0.25
