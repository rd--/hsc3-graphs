{- http://twitter.com/HernaniVillase/status/517517924236795905 ; rewrite (rd) -}
{ :tr |
	let f = TRand(97, 101, tr);
	let o = LfTri(
		{ TRand(0, 200, tr) + 216 } ! 8 + f,
		{ TRand(0, pi * 2, tr) } ! 8
	);
	let e = LfTri(
		{ TRand(0, 0.01, tr) + 0.1 } ! 8,
		0
	) * 0.1 + 0.01;
	(o * e).Splay2
}.OverlapTexture(3, 5, 3).Mix
