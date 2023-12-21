(* deep trip (jmcc) #9 ; graph rewrite ; left-to-right *)
{ :tr |
	var trRand = { :lo :hi | TRand(lo, hi, tr) };
	var f = LfNoise1(trRand(0, 0.3)).MulAdd(60, 70).MidiCps;
	var a = LfNoise2(f.Mul(trRand(0, 0.5))).Mul((LfNoise1(trRand(0, 8)).Mul(SinOsc(trRand(0, 40), 0)).Mul(0.1)).Max(0));
	var s = SinOsc(f, 0).Mul(a).Pan2(LfNoise1(trRand(0, 5)), 1);
	{ s.CombN(0.5, { trRand(0, 0.2) + 0.3 } ! 2, 20) } !+ 2 + s
}.OverlapTexture(12, 4, 4).Mix
