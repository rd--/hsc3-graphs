(* Decay2 *)
{
	var tr = Dust(1);
	var env = Decay2(
		tr,
		TRand(0.01, 0.2, tr),
		TRand(0.2, 1, tr)
	);
	SinOsc(TRand(110, 330, tr), 0) * env
} !^ 5
