/* https://social.ordinal.garden/@f0/111583733632579377 ; Dec 15, 2023 (f0) */
let t = { :z |
	LfSaw(z, 1) + 1 / 2
};
let r = 2 ^ (GbmanN(t(-1 / 60) * 4 + 4, 1.2, 2.1).Sin * (t(1 / 4) * 2 + 2)).Floor.Abs;
let c = 0:5.collect { :n |
	n * 12 + [2 15 7 12]
}.flatten;
let o = VarSaw(
	t(1 / 13) < 0.5 * 2 + 8 * pi * c.MidiRatio,
	0,
	t(r) / 2
) * ((t(r) ^ ((t(r / 2) * 4) + 1).Abs * c).Log.Sin.Max(0).Sin.Max(0) ^ 8);
let e = t(-1 * r) > (t(pi / r) / 1.5 + 0.05);
let x = BBandStop(
	Splay(
		o * e,
		LfTri(r, 0)
	),
	t(r / 8).LinExp(0, 1, 80, 5500),
	t(1 / 9) * 2 + 3
);
CombN(
	Rlpf(x, 800, 0.1),
	1,
	4 / 13,
	4
) / 2 + x
