// saucer base (jmcc) #6
{
	var b = 1000.0.rand;
	var c = 5000.0.rand;
	var o1 = SinOsc.ar(20.0.rand, 0) * b + (1.1 * b);
	var o2 = SinOsc.ar(o1, 0) * c + (1.1 * c);
	Pan2.ar(SinOsc.ar(o2, 0), 1.0.rand2, 0.1)
}.overlap(6, 2, 4)
