// Broken Saws ; https://github.com/lukiss/Losers-Union-SC-Research
var c = [49, 175, 98, 147, 65, 233];
var r = 3 / 4 / (1 .. c.size);
Splay.ar(
	BPF.ar(
		VarSaw.ar(
			VarSaw.ar(r + 6, 0, 1 / 2) * 2 + c,
			0,
			VarSaw.ar(1 / r, 0, 0.5) ** 2
		) ** (VarSaw.ar(0.001 / r + 8, 0, VarSaw.ar(1 / 3, 0, 0.5).abs) * 12 + 13),
		VarSaw.ar(
			0.003 / r,
			0,
			VarSaw.ar(r * 8, 0, 0.5)
		).lag3(0.1).abs * 4000 + 80,
		1.1 - VarSaw.ar(8 * r, 0, 0.5) ** 2
	) * VarSaw.ar(r / c, 0, 0.5) / 2,
	VarSaw.ar(1, 0, VarSaw.ar(1, 0, 0.5))
) * Line.kr(0, 1, 20)
