// https://sccode.org/1-4Qy ; f0 ; 0239
var b = 0.11 / (1 .. 6);
var q = " #SuperCollider ".ascii; // https://github.com/supercollider/supercollider/issues/5658
var o = LFTri.ar(Duty.ar(b, 0, Dseq(q.midicps, inf)), 0);
Splay.ar(CombC.ar(o, 4, LFTri.ar(b / 9, 0) % LFTri.ar(b, 0) * 4 % 4, 5) / 6).tanh
