(* https://sccode.org/1-4Qy ; f0 ; 0239 *)
var b = 0.11 / (1 .. 6);
var q = ' #SuperCollider '.ascii.asArray.MidiCps;
var o = LfTri(Duty(b, 0, Dseq(inf, q)), 0);
Splay(CombC(o, 4, LfTri(b / 9, 0) % LfTri(b, 0) * 4 % 4, 5) / 6).Tanh
