(* f0  https://twitter.com/redFrik/status/1210118661022867458 *)
var b = 1 / [2 .. 7];
var d = 1 / 48;
var g = 0.cos.cos;
var f = Duty(b, 0, Dseq(inf, '0 0 00 0 0 000  _0 0 0 00 00 00000+  !'.ascii.asArray));
var o = SinOscFb(f, SinOsc(d, 0).Max(0) * 0.cos.sin);
var c = SinOsc(0, pi ^ o);
var p = PitchShift(c, g, 1 / b, d, d) * b;
LeakDc(Splay(c + p), 0.995) * g
