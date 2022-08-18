// random pulsations (jmcc) #1
{
	var env = EnvGen.kr(Env.linen(2, 5, 2, 0.02), doneAction:2);
	var o1 = SinOsc.ar(2000.0.rand, 0) * env;
	var o2 = SinOsc.ar(8 + 80.0.linrand, 0);
	var o3 = SinOsc.kr(0.3 + 0.5.rand, (2 * pi).rand) * 0.7;
	Pan2.ar(o1.amclip(o2), o3)
}.spawn(9 / 8)
