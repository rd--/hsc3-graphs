(* CombC ; noise burst as input signal ; function to create comb delays with random delay times *)
let n = 8;
let z = Decay2(
	Impulse(0.5, 0),
	0.01,
	0.20
) * PinkNoise() * 0.1;
{
	CombC(
		z,
		0.1,
		Rand(0.01, 0.09),
		3
	)
} !^ n
