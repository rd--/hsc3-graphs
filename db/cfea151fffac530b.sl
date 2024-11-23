/* https://sonomu.club/@lukiss/113469893460208702 ; Nov 12, 2024, 11:06 PM ; ? see .scd */
let z = { :x | LfSaw(x, 0) };
let i = 4.fibonacciSequence; /* 1 1 2 3 */
let f = 2 ^ (0 .. 3) + i * 2;
let b = [0 2 5 7 9].asLocalBuf; /* 0 2 5 7 9 */
let l = DegreeToKey(
	b,
	StandardN(f, 1, 0.5, 0).Sin.Sanitize(0) * z(1 / f / i) * 12,
	12
).Ceiling;
let o = z(l.MidiRatio * 110 * i);
Splay(
	MoogFf(
		z(l / (4 ^ i)) + 1 / 2 ^ 4 * o,
		z(l / (4 ^ i + (o / 8))) + 1 / 2 ^ (z(o.Abs) + 1 / 2 ^ 2 * 8 + 0.5) * 8000 + 40,
		2,
		0
	),
	z(1)
)
