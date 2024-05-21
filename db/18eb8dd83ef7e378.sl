{- https://sonomu.club/@lukiss/112406789401906049 ; May 09, 2024 -}
let m = {
	LfdNoise3(1 / 7).ExpRange(0.01, 1)
};
let d = { :a :p |
	TDuty(Dseq(inf, a.pyramid(p)) / 8.3, 0, 1)
};
let q = [1 2 3 4 5 11 9];
let a = [
	m() > 0.05 * d((4 # 7) ++ [16 8], 3).Lag3Ud(0, 0.005),
	Hpf(m() > 0.05 * d(q, 5), 7777),
	m() > 0.05 * d(q, 5),
	3 / 5 * (m() > 0.1) * d([1 2 3 4 5 3 9], 6).Lag3Ud(1E-5, 1E-3),
	0.5 * (m() > 0.05) * d(q, 7).Lag3Ud(1E-7, 1E-3)
];
let b = GVerb(
	a,
	[1, 2, 2, 1, 2],
	[2, 8, m() * 4, 9, 6],
	[0.95, m(), m(), 0.9, 1 - m()],
	0.5, 15, 1, 0.7, 0.5, 300
);
let o = Splay(m:/0 ! 4 * b);
let p = CompanderD(o, 1 / 2, 1 / 3, 1 / 2, 0.01, 0.1) / 3;
(o / 3 + p).SoftClip.transposed.Sum
