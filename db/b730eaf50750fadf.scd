// https://sonomu.club/@lukiss/109875835273563824
var f = { | rt | Sweep.ar(0, rt) };
var t = f.value(4E4);
var c = f.value(1);
var r = (1 .. 5);
var b = (-1 * [24, 5, 0, 10, 8, 15].midiratio * t) & ((r + c).wrap(1, 3333)) & (t >> 105);
var e = b.lincurve(0, 127, -1, 1, -8).fold2(1) / 2;
Splay.ar(
	FreeVerb.ar(
		LFSaw.ar(-1 * r, 2).max(0).lag3(0.1) * LeakDC.ar(e, 0.999),
		1 / 3,
		c.sin.max(0),
		LFSaw.ar(c.cos, 0)
	),
	c.sin
)
