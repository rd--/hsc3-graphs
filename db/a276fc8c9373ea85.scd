// https://sonomu.club/@lukiss/110538742878262809
var c = (12 .. 38).scramble.degreeToKey([0, 2, 4, 7, 9], 12);
var w = LFSaw.ar(8, 0) * 0.012 + 1;
var t = [6, 3 / 2, 3, 3 / 4, 1 / 4];
var d = Demand.ar(
	TDuty.ar(1 / t, 0, 1, 0, 0),
	0,
	Dseq((0 .. 23).collect { | n | Dseq(c[0, n + 1 .. c.size - 1], 1) }, inf)
).lag3(0.001);
var e = LFSaw.ar(-1 * t, 1) * 1 + 1 / 2;
var o = (LFSaw.ar(w * d.midicps, 0) * e).fold2(1) * (LFSaw.ar(d % t.log, 0) > 0);
var f = e.lag3(0.005) ** (LFSaw.ar(pi / t, 1) * 8 + 9) * (LFSaw.ar(0.1 / t, 1) + 1 * 5E3 + 200);
Splay.ar(
	CombC.ar(MoogFF.ar(o, f, 2, 0), 0.2, 0.2, 1) * 0.8,
	LFSaw.ar(pi, 0)
)
