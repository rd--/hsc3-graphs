(* Random impulses *)
{
	var freq = 100.ExpRand(3000);
	var amp = Decay2(Dust(1 / 5), 0.1, (freq ^ -0.7) * 100);
	Pan2(SinOsc(freq * (LfNoise1(1 / 6) * 0.4 + 1), 0) * amp, LfNoise1(1 / 8), 1)
} !+ 15 * 0.1