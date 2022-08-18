// pond life ; jmcc ; #1
{
	var f = SinOsc.kr(20 + 30.0.rand, 0) * (100 + 300.0.rand) + 500 + 2000.0.linRand;
	var o = SinOsc.ar(f, 0) * LFPulse.kr(3 / (1 + 8.0.rand), 0, 0.2 + 0.3.rand);
	Pan2.ar(o, 1.0.rand2, 0.04)
}.overlap(8, 8, 4)
