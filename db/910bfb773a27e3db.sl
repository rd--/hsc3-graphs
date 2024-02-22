{- http://sccode.org/1-4Qy (F0) ; 0239 -}
let b = 0.11 / 1:6;
let q = ' #SuperCollider '.ascii.asList.MidiCps;
let o = LfTri(Duty(b, 0, Dseq(inf, q)), 0);
Splay(CombC(o, 4, LfTri(b / 9, 0) % LfTri(b, 0) * 4 % 4, 5) / 6).Tanh
