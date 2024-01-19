{- F0  http://twitter.com/redFrik/status/1210118661022867458 -}
let b = 1 / [2 .. 7];
let d = 1 / 48;
let g = 0.cos.cos;
let f = Duty(b, 0, Dseq(inf, '0 0 00 0 0 000  _0 0 0 00 00 00000+  !'.ascii.asArray));
let o = SinOscFb(f, SinOsc(d, 0).Max(0) * 0.cos.sin);
let c = SinOsc(0, pi ^ o);
let p = PitchShift(c, g, 1 / b, d, d) * b;
LeakDc(Splay(c + p), 0.995) * g
