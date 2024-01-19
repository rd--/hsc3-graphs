{- F0 ; http://twitter.com/redFrik/status/1395040511795372038 -}
let b = [2 6 3 1];
let c = 500;
let f = Duty(
	b,
	SinOscFb(b / 9, 0),
	Dseq(inf, (SinOscFb(b / 24, 0).RoundTo(1) + (0 .. 9) * 7 + 29.17).MidiCps)
);
let o = SinOscFb(f, SinOscFb(b / 13, 0).Max(0) / 3 * 2);
let p = AllpassC(o/8, 1, 0.51, 8);
let q = Bpf(
	Hasher(SinOscFb(b / 12, 0).Max(0)) * SinOscFb(b / c, 0).Max(0) / c,
	2 ^ SinOscFb(b / c * 2, 0) * 1000,
	1 / 99
);
Hpf(p + GVerb(q, 99, 9, 0.2, 0.5, 15, 1, 0.7, 0.5, 300), 50).clump(2).Sum.transposed.Mix * 0.2
