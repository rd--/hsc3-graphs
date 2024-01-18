// https://sccode.org/1-4Qy ; tweet0002 ; f0 ; graph variant
(0 .. 98).collect({
	arg i = 0;
	var o = BPF.ar(Impulse.ar(LinRand.ir(0.5, 18.5, 0), 0), LinRand.ir(0, 9999, 0), LinRand.ir(0, 0.3, 0)) * 5;
	var e = LinSeg(1, [0, i * 3, 0, 0.01, 1, 2, 1, 9, 0]);
	Pan2.ar(o, Rand.ir(-1, 1), e)
}).sum
