/* https://sonomu.club/@lukiss/112090216321959038 ; Mar 14, 2024 */
let m = {
	FbSineL(
		LfdNoise1(2).ExpRange(0.01, 1) * 14 + 0.5,
		1, 0.1, 1.1, 0.5, 0.1, 0.1
	).Lag3(0.1).Sin.ExpRange(0.01, 1)
};
let g = Dust(m() + m() * 6);
let r = LfdNoise1(2).ExpRange(0.01, 1) / 8;
let e = Perc(g, 0.001, r, -4);
let o = FbSineL(
	1 - m() * 5888 + 88,
	m() * 3,
	m() ^ 2,
	m() + 1,
	m() / 2,
	0.1,
	0.1
);
let c = CombC((e * o).Sin.SoftClip, 1, 0.001 + m(), m() * 8).Sin * 0.9 + (PinkNoise() * -64.DbAmp);
let l = LeakDc(c, 0.995);
let v = GVerb(
	l.Sin,
	5,
	m() * 8 + 1,
	1 - (m() ^ 2),
	1 / 2,
	29,
	1,
	m(),
	1 - m(),
	m() * 215
);
Splay((v + l).SoftClip * -6.DbAmp)
