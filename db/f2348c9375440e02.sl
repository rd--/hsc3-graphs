(* https://twitter.com/redFrik/status/1143262368392200192 *)
let c = 4 / 4 / 4;
let d = c * 4 / 44.4;
let f = (VarSaw(d, c, -4.sin) * 4).Max(0).Ceiling * 44 + 44;
let b = VarSaw(f, 4, VarSaw([44 - 4, 4, 44 + 4] / 4.44, 0, 0.5)) / 4;
let o = Rlpf(VarSaw(VarSaw(c / 4, c, c).Max(0) * 4 + 44, 4, VarSaw([4, 4 / 44, c * 4], 0, 0.5).Abs), 44 * 44, c);
let q = PitchShift(CombC(b, c, c * 4 / f + d, 1), 4 - c, [4 + 4 + 4, 4 * 4, 4 + 4], c, c) * (c + c);
(o * Line(0, 1, 4) + q).Splay2 / 4
