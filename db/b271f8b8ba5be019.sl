{- https://sccode.org/1-4Qy ; f0 ; 0308 -}
let b = [1 .. 9];
let o = Blip(Blip(Blip(2.01, 3) > 0, b) + 1, b / 8) + 2 * 99;
let a = Formlet(o, b * 50, 0.01, 1).Tanh.Splay;
FreqShift(a, 0.01, 0) + a / 7
