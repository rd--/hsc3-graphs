{- http://sccode.org/1-4Qy (F0) ; 0358 -}
let b = LfTri(2 / [9 8 7], 0);
let f = [2 3 4 5] / (LfTri(0.1, 0) > 0 + 2) ^ Lag(LfTri(b, 0).Ceiling, 0.1) * 99 * [3 1 8 2 4];
let o = Pulse(Fold(f, 9, 999), 2 - b / 5);
o.Splay / 2 / 2
