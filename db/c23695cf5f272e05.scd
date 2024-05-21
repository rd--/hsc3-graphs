// https://sonomu.club/@lukiss/112406789401906049
var m = {
	LFDNoise3.kr(1 / 7).exprange(0.01, 1.0)
};
var d = { |a p|
	TDuty.ar(Dseq(a.pyramid(p), inf) / 8.3, 0, 1, 0, 0)
};
var q = (1 .. 5) ++ [11, 9];
var a = [
	m.value > 0.05 * d.value((4 ! 7) ++ [16, 8], 3).lag3(0, 0.005),
	HPF.ar(m.value > 0.05 * d.value(q, 5), 7777),
	m.value > 0.05 * d.value(q, 5),
	3 / 5 * (m.value > 0.1) * d.value((1..5) ++ [3, 9], 6).lag3(1E-5, 1E-3),
	0.5 * (m.value > 0.05) * d.value(q, 7).lag3(1E-7, 1E-3)
];
var b = GVerb.ar(
	a,
	[1, 2, 2, 1, 2],
	[2, 8, m.value * 4, 9, 6],
	[0.95, m.value, m.value, 0.9, 1 - m.value],
	0.5, 15, 1, 0.7, 0.5, 300
);
var o = Splay.ar(m ! 4 * b);
var p = CompanderD.ar(o, 1 / 2, 1 / 3, 1 / 2, 0.01, 0.1) / 3;
(o / 3 + p).softclip.flop.sum
