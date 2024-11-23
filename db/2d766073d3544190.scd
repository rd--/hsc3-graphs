/* https://sonomu.club/@lukiss/113469893460208702 ; Nov 12, 2024, 11:06 PM */
var z = { |x| LFSaw.ar(x, 0) };
var i = 4.fib; /* 1 1 2 3 */
var f = 2 ** (0 .. 3) + i * 2;
var b = Scale.zhi.as(LocalBuf); /* 0 2 5 7 9 */
var l = DegreeToKey.ar(
	b,
	StandardN.ar(f, 1.0, 0.5, 0.0).sin.sanitize * z.value(1 / f / i) * 12,
	12
).ceil;
var o = z.value(l.midiratio * 110 * i);
Splay.ar(
	MoogFF.ar(
		z.value(l / (4 ** i)) + 1 / 2 ** 4 * o,
		z.value(l / (4 ** i + (o / 8))) + 1 / 2 ** (z.value(o.abs) + 1 / 2 ** 2 * 8 + 0.5) * 8000 + 40,
		2,
		0
	),
	z.value(1)
)
