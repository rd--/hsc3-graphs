let n = 24;
{ :tr |
	{
		SinOsc(TRand(220, 990, tr), 0)
	} ! n / n / 3
}.OverlapTexture(3, 3, 3).Mix
