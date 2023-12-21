(* hell is busy (jmcc) #1 ; graph rewrite ; left-to-right *)
{ :tr |
	var trRand = { :lo :hi | TRand(lo, hi, tr) };
	var e = LfPulse(trRand(1, 11), 0, trRand(0, 0.7)) * 0.04;
	SinOsc(trRand(400, 2400), 0).Pan2(trRand(-1, 1), e)
}.OverlapTexture(4, 4, 8).Mix
