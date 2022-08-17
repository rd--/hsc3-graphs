// alien meadow (jmcc) #6
{
	var b = Rand.ir(0, 5000);
	var o1 = SinOsc.ar(Rand.ir(0, 20), 0) * (0.1 * b) + b;
	var o2 = SinOsc.kr(Rand.ir(0, 20), 0) * 0.05 + 0.05;
	var o3 = SinOsc.ar(o1, 0) * o2;
	Pan2.ar(o3, Rand.ir(-1, 1), 1)
}.overlap(6, 2, 6)
