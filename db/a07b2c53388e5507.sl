(* http://sccode.org/1-Z (jl) ; requires=kr *)
let a = Lag(Impulse(8, 0), 0.1).kr;
let b = Crackle(Lag(LfSaw(3, 0).Abs, 0.1).kr * 1.8);
let c = a * b;
let d = Lag(Impulse(2, 0) + Impulse(4, 0.5), 0.1).kr;
let e = Blip(4.9, 7) * 0.4;
let f = d * e;
(c + GVerb(f, 1, 1, 0.5, 0.5, 15, 1, 0.7, 0.5, 300) * 5).Tanh * 0.25
