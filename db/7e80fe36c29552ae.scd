// SinOsc
1.to(5). collect({
	arg n;
	Pan2.ar(SinOsc.ar(n * 100, 0) * 0.max(LFNoise1.kr(6) + Ln.kr(1, -1, 30)), Rand.ir(-1, 1), 0.1)
}).sum
