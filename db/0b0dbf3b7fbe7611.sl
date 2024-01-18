{- https://sccode.org/1-4Qy ; f0 ; 0337 -}
let b = (1 .. 12) / 8;
let f1 = Formant(b, b / 3.5 + 80, 999 - b / 9) + 3 * 50;
let f2 = Formant(b / 3, 2.5, 5) > 0 + 1 * 300;
let f3 = Formant(b / 5, 2, 3) > 0 * 1200;
Splay(Formant(f1, f2, f3) / 3).Tanh
