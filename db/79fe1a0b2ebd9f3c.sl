;; SinOsc
{
	var tr = Dust(1);
	var freq = TRand(3785, 3800, tr);
	var amp = SinOsc(TRand(10, 30, tr), 0) * 0.2;
	var osc = SinOsc(freq, 0) * amp + SinOsc({ TRand(2.91, 3.02, tr) } ! 2 * freq, 0);
	var env = Decay2(tr, 0.01, 1);
	osc * env * 0.4
} !+ 12
