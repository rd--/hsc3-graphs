{- https://sonomu.club/@lukiss/111455666847951601 ; Nov 23, 2023 -}
let t = {
	TDuty(Dseq(inf, [3 4 2 1 2 4] / 8), 0, 1).kr
};
let r = { :l :h |
	TExpRand(l, h, t()).Lag3Ud(1 / 48, 1 / 16)
};
let e = Perc(t(), r(1 / 128, 2 / 8), 1 / 6, -4).kr;
let o = (Blip(r(11, 111), r(1 / 3, 333)) * e).Tanh;
3.timesRepeat {
	o := LeakDc(
		CombC(
			o,
			3 / 4,
			r(1 / 512, 3 / 4) * (LfdNoise1(6 # 2).kr * 0.001 + 1),
			r(1 / 2, 1 / 64) * TChoose(t(), [-1, 1]).kr
		).Tanh,
		0.995
	).Sanitize(0)
};
o.SoftClip
