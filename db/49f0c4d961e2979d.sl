/* Perc */
{
	let tr = Dust(1 / 4);
	SinOsc(TRand(200, 500, tr), 0) * Perc(tr, 0.01, TRand(1, 4, tr), -4) * 0.2
} !^ 9
