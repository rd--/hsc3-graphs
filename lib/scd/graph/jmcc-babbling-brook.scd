// babbling brook (jmcc) #SC3
var b = {
	arg f, m, a, g;
	var n1 = OnePole.ar(BrownNoise.ar, 0.99);
	var n2 = LPF.ar(BrownNoise.ar, f);
	RHPF.ar(n1, n2 * m + a, 0.03) * g};
	{b.value(14, 400, 500, 0.06)}.dup + {b.value(20, 800, 1000, 0.10)}.dup
