// Ambient Ligeti inspired soundscape ; https://github.com/lukiss/Losers-Union-SC-Research
var r = { | n |
	{ LFDNoise3.ar(1 / 86).abs } ! n
};
Splay.ar(
	LeakDC.ar(
		FreeVerb.ar(
			Warp1.ar(
				1,
				Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav"),
				r.(9),
				[-36, -9, -14, 0, -19, -5, 3, -2, -24, -7].midiratio,
				8 * r.(9) + 8 / 86,
				-1,
				12,
				1 / 4 * r.(9),
				4
			) * r.(9),
			r.(9),
			0.5 + r.(9)
		) *	r.(9),
		0.995
	),
	2 / 4
).tanh * Line.kr(0, 1, 12)
