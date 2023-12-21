(* alien meadow (jmcc) #6 ; left-to-right *)
{ :tr |
	var trRand = { :lo :hi | TRand(lo, hi, tr) };
	var z = trRand(0, 5000);
	var f = SinOsc(trRand(0, 20), 0).MulAdd(0.1 * z, z);
	var a = SinOsc(trRand(0, 20), 0).MulAdd(0.05, 0.05);
	SinOsc(f, 0).Pan2(trRand(-1, 1), a)
}.OverlapTexture(6, 2, 6).Mix
