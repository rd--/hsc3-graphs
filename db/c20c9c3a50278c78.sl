{- https://swiki.hfbk-hamburg.de/MusicTechnology/899 (Nv) [Line 41] -}
(1 .. 15).collect { :i |
	let f = 1.9 ^ i / 128;
	let p = PinkNoise(2);
	let b = 4 ^ LfNoise2(1.2 ^ i / 16);
	Bpf(p, b * 300, 0.15) * (5 ^ LfNoise2(f) / (i + 8) * 20)
}.Splay2.transposed.Mix
