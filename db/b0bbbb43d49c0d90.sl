(* SinOsc ; requires 0.Max(aUgen) *)
let n = 16;
{
	let amp = 0.Max(SinOsc(ExpRand(0.1, 1), Rand(0, 2 * pi))) / n / 2;
	EqPan(
		SinOsc(ExpRand(100, 1000), 0) * amp,
		Rand(-1, 1)
	)
} !+ n
