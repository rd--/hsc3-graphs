// f0  https://twitter.com/redFrik/status/1210118661022867458
var b = (2 .. 7).reciprocal;
var d = $0.ascii.reciprocal;
var g = 0.cos.cos;
var f = Duty.ar(b, 0, Dseq("0 0 00 0 0 000  _0 0 0 00 00 00000+  !".ascii, inf), 0);
var o = SinOscFB.ar(f, SinOsc.ar(d, 0).max(0) * 0.cos.sin);
var c = SinOsc.ar(0, pi ** o);
var p = PitchShift.ar(c, g, b.reciprocal, d, d) * b;
LeakDC.ar(Splay.ar(c + p), 0.995) * g
