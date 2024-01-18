{- https://sccode.org/1-4Qy ; f0 ; 0296 -}
let f = (0 .. 7).collect { :i |
	let p = SinOscFb(2 ^ (1 / 8) ^ i, i / 8) * SinOscFb(i + 8 / 8, 0);
	let q = SinOscFb(i + [2, 3] / 88, 0);
	p > q
}.Sum * 88;
Hpf(CombN(SinOscFb(f, SinOscFb(1 / 18, 1)), 0.2, 0.2, 1), 8) / 3
