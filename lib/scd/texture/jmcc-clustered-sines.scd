// clustered sines (jmcc) #2
{
	var n = 80;
	var f1 = 100 + 1000.0.rand;
	var f2 = 4.0 * f1;
	{
		var y = { f1 + f2.rand }.dup(n);
		var a = f1 / y;
		SinOscBank.ar(y, a, nil) / n
	}.dup(2)
}.xfade(4, 4)
