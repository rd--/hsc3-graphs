// random pulsations (jmcc) #1 ; texture=spawn,1.125,inf
var env = EnvGen.kr(Env.linen(2, 5, 2, 0.02), 1, 1, 0, 1, 2);
var o1 = FSinOsc.ar(Rand.ir(0, 2000), 0) * env;
var o2 = SinOsc.ar(8 + LinRand.ir(0, 80, 0), 0);
var o3 = SinOsc.kr(0.3 + Rand.ir(0, 0.5), Rand.ir(0, 2 * pi)) * 0.7;
Pan2.ar(o1.amclip(o2), o3)