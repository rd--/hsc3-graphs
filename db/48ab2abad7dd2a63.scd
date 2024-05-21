// https://sonomu.club/@lukiss/112090216321959038
var m = {
	FBSineL.ar(
		LFDNoise1.ar(2).exprange(0.01, 1) * 14 + 0.5,
		1, 0.1, 1.1, 0.5, 0.1, 0.1
	).lag3(0.1).sin.exprange(0.01, 1)
};
var g = Dust.ar(m.value + m.value * 6);
var r = LFDNoise1.ar(2).exprange(0.01, 1) / 8;
var e = Env.perc(0.001, r, 1, -4).ar(0, g);
var o = FBSineL.ar(
	1 - m.value * 5888 + 88,
	m.value * 3,
	m.value ** 2,
	m.value + 1,
	m.value / 2,
	0.1,
	0.1
);
var c = CombC.ar((e * o).sin.softclip, 1, 0.001 + m.value, m.value * 8).sin * 0.9 + (PinkNoise.ar() * -64.dbamp);
var l = LeakDC.ar(c, 0.995);
var v = GVerb.ar(
	l.sin,
	5,
	m.value * 8 + 1,
	1 - (m.value ** 2),
	1 / 2,
	29,
	1,
	m.value,
	1 - m.value,
	m.value * 215
);
Splay.ar((v + l).softclip * -6.dbamp)
