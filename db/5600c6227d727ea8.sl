(* SinOsc *)
SinOsc(
	LfNoise2(
		SinOsc([3, 5], 0).Range([2, 7], 35)
	).Range(100, [200, 300]),
	0
) * 0.1
