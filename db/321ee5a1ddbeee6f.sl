;; Perc
{
	var t = Dust(1 / 4);
	SinOsc(TRand(200, 500, t), 0) * Perc(t, 0.01, TRand(1, 4, t), -4) * 0.2
} !^ 9