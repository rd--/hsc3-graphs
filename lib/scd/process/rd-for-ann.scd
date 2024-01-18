// james tenney - for ann (rising)
240.do({
	{
		var d = 33.6;
		var f0 = 40;
		var f1 = 40 * (2**8);
		var fe = Env([f0, f1], [d], \exp);
		var f = EnvGen.ar(fe, 1, 1, 0, 1, 0);
		var ae = Env.linen(d / 4, d / 2, d);
		var a = EnvGen.ar(ae, 1, 0.1, 0, 1, 2);
		Pan2.ar(SinOsc.ar(f, 0, a))
	}.play;
	2.8.wait
})
