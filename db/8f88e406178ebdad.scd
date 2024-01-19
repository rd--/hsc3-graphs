// https://twitter.com/redFrik/status/1143262368392200192
var c = 4 / 4 / 4;
var d = c * 4 / 44.4;
var f = (VarSaw.ar(d, c, -4.sin) * 4).max(0).ceil * 44 + 44;
var b = VarSaw.ar(f, 4, VarSaw.ar([44 - 4, 4, 44 + 4] / 4.44, 0, 0.5)) / 4;
var o = RLPF.ar(VarSaw.ar(VarSaw.ar(c / 4, c, c).max(0) * 4 + 44, 4, VarSaw.ar([4, 4 / 44, c * 4], 0, 0.5).abs), 44 * 44, c);
var q = PitchShift.ar(CombC.ar(b, c, c * 4 / f + d, 1), 4 - c, [4 + 4 + 4, 4 * 4, 4 + 4], c, c) * (c + c);
Splay.ar(o * Line.ar(0, 1, 4, 0) + q) / 4
