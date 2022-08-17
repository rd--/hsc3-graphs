// random sine waves (jmcc) #1
{
	var env = Env.linen(2, 5, 2);
	var osc = FSinOsc.ar(2000.0.rand, 0) * EnvGen.kr(env, doneAction: 2, levelScale: 0.02);
	Pan2.ar(osc, 1.0.rand2, 1)
}.spawn(9 / 12)
