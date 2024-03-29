{- Dragtokeyboard (Jmcc) ; Graph rewrite ; http://www.iamas.ac.jp/~aka/dspss2004/materials/ -}
{ :tr |
	let sr = TExpRand(300, 3000, tr) + [-0.6 0.6];
	let p1 = LfPulse(TExpRand(0.1, 1, tr), 0, 0.3) * 0.2 + 0.02;
	let p2 = LfPulse(TExpRand(0.1, 12, tr), 0, 0.4) * 0.2 + 0.2;
	let p3 = LfPulse(TExpRand(0.1, 12, tr), 0, 0.7) * 0.2 + p2;
	let p4 = LfPulse(sr, 0, MouseY(0.01, 0.99, 0, 0.2)) * p1;
	Rlpf(
		LfSaw([21000 21001], 0) * p4,
		sr * p3,
		0.1
	)
}.OverlapTexture(4, 4, 2).Mix
