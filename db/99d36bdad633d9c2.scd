// SinOsc
(1 .. 5). collect { |n|
	Pan2.ar(SinOsc.ar(n * 100, 0) * 0.max(LFNoise1.kr(6) + Ln.kr(1, -1, 30)), Rand(-1, 1), 0.1)
}.sum
