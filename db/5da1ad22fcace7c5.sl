{- https://sccode.org/1-4Qy ; f0 ; 0233 ; requires=kr -}
let b = 1 / [1 4 6 8 11];
let c = LfTri(b / 98, 0);
let q = Dseq(inf, Select(LfTri(b / 99, 0) + c * 5, 1 / b + 59).kr).MidiCps;
Splay(LfTri(Duty(b, c, q) + c, 0) / 3)
