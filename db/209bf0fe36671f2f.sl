{- 5 Sep. 2020 ; https://github.com/lukiss/Losers-Union-SC-Research ; requires=kr -}
let l = {
	LfdNoise3(1).Abs.kr
};
let r = { :freq :mul |
	(Gendy3(6, 6, l(), l(), freq, l(), l(), 5, l() * 5) * mul).Abs.kr
};
-12.DbAmp * Splay(
	(1 .. 6).collect { :n |
		CombC(
			LeakDc(
				Fm7Matrix(
					{
						[
							Rand(0, 80).MidiCps,
							0,
							Blip(r(l(), 24), r(l(), 228)).Abs.kr
						]
					} ! 6,
					r(0.02, 0.5) ! 6 ! 6
				)[n],
				0.995
			),
			0.5,
			0.05 + r(0.04, l()),
			1
		)
	}
)
