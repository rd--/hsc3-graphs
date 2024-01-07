(* Phase modulation, all three *)
{
	let car = LfNoise0(9) * 300 + 700;
	let mod = LfNoise0(9) * 500 + 700;
	let ix = LfNoise0(9) * 6 + 12;
	PmOsc(car, mod, ix, 0) * 0.15
} ! 2
