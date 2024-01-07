(* tw 0120 (f0) ; requires=kr *)
let z = LfTri(1 / [7, 8], 0) * LfTri(1 / 9, 0) * 99;
let l = (60 .. 79).MidiCps;
let f = Select(z, l);
let w = LfTri(1 / [3, 4], 0) % 1;
let o = VarSaw(f.kr, 0, w.kr);
CombN(o, 1, 1 / [5, 6], 8) / 8
