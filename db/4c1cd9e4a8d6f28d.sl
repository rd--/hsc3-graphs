(* https://sccode.org/1-4Qy ; f0 ; 0233 *)
let b = 1 / [1 4 6 8 11];
let c = LfTri(b / 98, 0);
let s = BufRd(1, (1 / b + 59).asLocalBuf, LfTri(b / 99, 0) + c * 5, 0, 1);
let q = Dseq(inf, s).MidiCps;
Splay(LfTri(Duty(b, c, q) + c, 0) / 2)
