(* Decay2 *)
{
	var lfo = SinOsc(Rand(1, 13), 0);
	var tr = Tr1(lfo);
	var env = Decay2(tr, 0.01, Rand(0.1, 0.5));
	SinOsc(Rand(1111, 2222), 0) * env * Rand(0.01, 0.1)
} !^ 24
