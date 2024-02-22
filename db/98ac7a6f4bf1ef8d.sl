{- KaosSprinkler ; https://github.com/lukiss/Losers-Union-SC-Research -}
let c = 1.5 ^ [0, 4 .. 12];
let e = StandardN(c, 1, 0.5, 0).ExpRange(0.01, 1);
Splay(
	LeakDc(
		-12.DbAmp * StandardN(
			e * c * 220,
			LfdNoise3(1 # 4) * 0.1 + 0.97215,
			1 / 4,
			1 / 4
		) * e.reversed,
		0.995
	),
	StandardN(e.last * 14, 1, 0.5, 0)
)
