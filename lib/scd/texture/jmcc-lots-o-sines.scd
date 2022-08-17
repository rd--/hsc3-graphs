// lots-o-sins (jmcc) #2
{
	var n = 60;
	{
		SinOscBank.ar(
			{ 40 + 10000.0.linRand}.dup(n),
			nil,
			nil
		)
	}.dup * (0.1 / n)
}.overlap(4, 4, 2)
