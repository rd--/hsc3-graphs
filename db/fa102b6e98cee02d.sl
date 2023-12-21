(* Random impulses ; Decay2 *)
{
	var freq = ExpRand(100, 3000);
	var t = Dust(1 / 5);
	var amp = Decay2(t, 0.01, freq ^ -0.7 * 100);
	Pan2(SinOsc(freq * (LfNoise1(1 / 6) * 0.4 + 1), 0) * amp, LfNoise1(1 / 8), 1)
} !+ 15 * 0.1
