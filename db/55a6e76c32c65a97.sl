{- http://sccode.org/1-4Qy (F0) ; 0248 -}
let d = LfTri(0.1, 0) < 0;
let b = d + [2 .. 8] / (d + 2);
let o = LfTri(b * 99, 0);
let r = Ringz(LfTri(b / 2, 0) > 0, b * 99, 5 ^ LfTri(LfTri(0.01, 0) + 2 - b, 0) / 4);
Splay(o + r).Tanh / 4
