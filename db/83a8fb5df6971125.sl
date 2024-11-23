/* https://sonomu.club/@lukiss/112015967098344604 ; Mar 01, 2024 */
let f = 111 * [0 1.04955 2.97513 4.70781 7.01955 8.40528 9.68826 0].MidiRatio;
let e = {
	LfSaw(GrayNoise() * (1 / 7 # 8) - 7, 0).Lag3(0.001).Max(0)
};
let v = SinOsc(1 - e() / f, 4) + 1 / 2 ^ 2;
let p = LfPulse(
	f @* [8 .. 2] / 111,
	0,
	1 - v
) * [1 2 4];
let o = VarSaw(
	f + (p * f),
	0,
	1 - e() ^ 2 / 2
) * (p.rotatedRight(2) - e() @* [8 .. 1] ^ 0.125);
let r = FreeVerb(
	Bpf(
		o * e() ^ 2,
		1 - e() * v * 11111 + 111,
		1.1 - v
	),
	1 - v,
	v @* [8 .. 1],
	0.999
) * (1 - (e() ^ 4)) + (e() * v * o);
Splay(r, (v[8] * 111).Sin)
