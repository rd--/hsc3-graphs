{- Ambient Ligeti inspired soundscape ; https://github.com/lukiss/Losers-Union-SC-Research -}
let r = { :n |
	{ LfdNoise3(1 / 86).Abs } ! n
};
Splay(
	LeakDc(
		FreeVerb(
			Warp1(
				1,
				SfAcquireMono("floating_1"),
				r(9),
				[-36 -9 -14 0 -19 -5 3 -2 -24 -7].MidiRatio,
				8 * r(9) + 8 / 86,
				-1,
				12,
				1 / 4 * r(9),
				4
			) * r(9),
			r(9),
			0.5 + r(9),
			r(9)
		),
		0.995
	),
	2 / 4
).Tanh * Line(0, 1, 12)
