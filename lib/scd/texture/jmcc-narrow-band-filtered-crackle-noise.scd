// narrow band filtered crackle noise (jmcc) #2
{
	var e = Env.linen(2, 5, 2);
	var rf1 = 2000.0.rand + 80;
	var rf2 = rf1 + (0.2.rand2 * rf1);
	var rf = XLine.kr(rf1, rf2, 9);
	var c = Crackle.ar(1.97 + 0.03.rand) * 0.15;
	Pan2.ar(Resonz.ar(c, rf, 0.2), 1.0.rand2, EnvGen.ar(e, doneAction:2))
}.spawn(2)
