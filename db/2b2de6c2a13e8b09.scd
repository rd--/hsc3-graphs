// KaosSprinkler ; https://github.com/lukiss/Losers-Union-SC-Research
var c = 1.5 ** (0, 4 .. 12);
var e = StandardN.ar(c, 1, 0.5, 0).exprange(0.01, 1);
Splay.ar(
	LeakDC.ar(
		-12.dbamp * StandardN.ar(
			e * c * 220,
			LFDNoise3.ar(1 ! 4) * 0.1 + 0.97215,
			1 / 4,
			1 / 4
		) *	e.reverse
	),
	StandardN.ar(e.last * 14, 1, 0.5, 0)
)
