{- http://sccode.org/1-4Qy ; tweet0002 (F0) ; graph variant -}
0:98.collect { :i |
	let o = Bpf(Impulse(LinRand(0.5, 18.5, 0), 0), LinRand(0, 9999, 0), LinRand(0, 0.3, 0)) * 5;
	let e = LinSeg(1, [0, i * 3, 0, 0.01, 1, 2, 1, 9, 0]);
	EqPan2(o, Rand(-1, 1)) * e
}.Sum
