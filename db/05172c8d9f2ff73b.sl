(* Alien meadow (Jmcc) #6 ; left-to-right *)
{ :tr |
	let trRand = { :lo :hi | TRand(lo, hi, tr) };
	let z = trRand(0, 5000);
	let f = SinOsc(trRand(0, 20), 0).MulAdd(0.1 * z, z);
	let a = SinOsc(trRand(0, 20), 0).MulAdd(0.05, 0.05);
	SinOsc(f, 0).Pan2(trRand(-1, 1), a)
}.OverlapTexture(6, 2, 6).Mix
