{- Broken Saws ; https://github.com/lukiss/Losers-Union-SC-Research ; https://sonomu.club/@lukiss/110561365086055899 -}
let c = [49 175 98 147 65 233];
let r = 3 / 4 / (1 .. c.size);
Splay(
	Bpf(
		VarSaw(
			VarSaw(r + 6, 0, 1 / 2) * 2 + c,
			0,
			VarSaw(1 / r, 0, 0.5) ^ 2
		) ^ (VarSaw(0.001 / r + 8, 0, VarSaw(1 / 3, 0, 0.5).Abs) * 12 + 13),
		VarSaw(
			0.003 / r,
			0,
			VarSaw(r * 8, 0, 0.5)
		).Lag3(0.1).Abs * 4000 + 80,
		1.1 - VarSaw(8 * r, 0, 0.5) ^ 2
	) * VarSaw(r / c, 0, 0.5) / 2,
	VarSaw(1, 0, VarSaw(1, 0, 0.5))
) * Line(0, 1, 20)
