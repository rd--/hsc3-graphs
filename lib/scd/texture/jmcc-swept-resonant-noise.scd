// swept resonant noise (jmcc) #2
{
	var p = 10; // number of partials
	var n = WhiteNoise.ar * 0.007;
	var f = (SinOsc.kr(0.1 + 0.2.rand, 0) * (12 + 12.rand2) + 60 + 24.rand2).midicps;
	var sweep = Resonz.ar(n, f, 0.1);
	{ RingzBank.ar(
		sweep,
		{ 80 + 10000.0.linRand0 }.dup(p),
		nil,
		{ 0.5 + 2.0.rand }.dup(p)
	) }.dup(2)
}.overlap(4, 4, 5)
