// https://twitter.com/rukano/status/98315246548172800
{
	{
		var h = [100, 800, 3000].choose;
		var o = { SinOsc.ar(ExpRand.ir(60, h), 0) * 0.1 };
		Splay.ar(o.dup(40)) * LFGauss.ar(19, 1/4, 0, 0, 2)
	}.play;
	8.seconds.wait
}.loop
