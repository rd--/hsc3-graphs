(* Deep trip (Jmcc) #9 ; graph rewrite (Rd) *)
{ :tr |
	let f = (LfNoise1(TRand(0, 0.3, tr)) * 60 + 70).MidiCps;
	let a = LfNoise2(f * TRand(0, 0.5, tr)) * (LfNoise1(TRand(0, 8, tr)) * SinOsc(TRand(0, 40, tr), 0) * 0.1).Max(0);
	let z = SinOsc(f, 0) * a;
	let s = Pan2(z, LfNoise1(TRand(0, 5, tr)), 1);
	{
		CombN(s, 0.5, { TRand(0, 0.2, tr) + 0.3 } ! 2, 20)
	} !+ 2 + s
}.OverlapTexture(12, 4, 4).Mix
