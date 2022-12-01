// resonant dust (jmcc) #2
{
	var rf1 = 2000.0.rand + 80;
	var rf2 = rf1 + (0.5.rand2 * rf1);
	var d = Dust.ar(50 + 800.rand, 0.3);
	var s = Resonz.ar(d, XLine.kr(rf1, rf2, 9), 0.1);
	Pan2.ar(s, 1.0.rand2, EnvGen.ar(Env.linen(2, 5, 2), doneAction:2))
}.spawn(2)
