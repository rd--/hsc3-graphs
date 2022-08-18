// ring modulated klank ; jmcc ; #2
{
	var p = 8; // number of partials
	var i = Dust.ar(20) * 0.02;
	var a = RingzBank.ar(i, { 100.rrand(10000) }.dup(p), nil, { 0.2.rrand(1.0) }.dup(p));
	var o = SinOsc.ar(LFNoise2.kr(1.0 + 0.3.rand2) * 200 + 350 + 50.rand, 0) * a;
	Pan2.ar(o, 1.0.rand2, 1)
}.overlap(4, 4, 4)
