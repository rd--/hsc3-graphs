// https://sonomu.club/@lukiss/111455666847951601
var t = {
	TDuty.kr(Dseq([3, 4, 2, 1, 2, 4] / 8, inf), 0, 1, 0, 0)
};
var r = { | l h |
	TExpRand.kr(l, h, t.value).lag3(1 / 48, 1 / 16)
};
var e = Env.perc(r.value(1 / 128, 2 / 8), 1 / 6, 1, -4).kr(0, t.value);
var o = (Blip.ar(r.value(11, 111), r.value(1 / 3, 333)) * e).tanh;
3.do {
	o = LeakDC.ar(
		CombC.ar(
			o,
			3 / 4,
			r.value(1 / 512, 3 / 4) * (LFDNoise1.kr(6 ! 2) * 0.001 + 1),
			r.value(1 / 2, 1 / 64) * TChoose.kr(t.value, [-1, 1])
		).tanh,
		0.995
	).sanitize
};
o.softclip
