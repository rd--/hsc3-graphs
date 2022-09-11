// jj ; bohlen-pierce
{
	{
		var f = { arg x; x * 3.pow(17.rand / 13) };
		var e = EnvGen.ar(Env.perc(0.01, 1, 1, -4), 1, 0.1, 0, 1, doneAction: 2);
		PMOsc.ar(f.value([438, 442]), f.value(880), f.value(e)) * e
	}.play;
	[1 / 6, 1 / 3].choose.seconds.wait
}.loop
