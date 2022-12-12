// https://sccode.org/1-4ZS ; the perfect frequencies (rzzr)
{
	var scale = [0.16, 1.66, 3.7, 5.53, 6.64, 7.69, 8.68, 10.51];
	var m = (2 .. 10).collect({ arg o; o * 12 + scale }).flatten.select({ arg each; each > 32 && { each < 127 } });
	Splay({ SinOsc.ar(m.choose.midicps, 0) * 0.1.rand } ! 3.rrand(11))
}.overlap(3, 5, 4)
