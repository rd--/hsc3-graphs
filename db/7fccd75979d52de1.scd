// https://sonomu.club/@lukiss/111583491682015266
var t = { |z|
	LFSaw.ar(z, 1) + 1 / 2
};
var r = 2 ** (GbmanN.ar(t.value(-1 / 60) * 4 + 4, 1.2, 2.1).sin * (t.value(1 / 4) * 2 + 2)).floor.abs;
var c = (0 .. 5).collect { |n| n * 12 + [2, 15, 7, 12] }.flat;
var o = VarSaw.ar(
	10 * pi * c.midiratio,
	0,
	t.value(r) / 2
) * ((t.value(r) ** ((t.value(r / 2) * 4) + 1).abs * c).log.sin.max(0).sin.max(0) ** 8);
var e = t.value(-1 * r) > (t.value(pi / r) / 1.5 + 0.05);
BBandStop.ar(
	Splay.ar(
		o * e,
		LFTri.ar(r, 0)
	),
	t.value(r / 8).linexp(0, 1, 80, 5500),
	t.value(1 / 9) * 2 + 3
)
