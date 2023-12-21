(* 3 Nov 2018 ; https://github.com/lukiss/Losers-Union-SC-Research ; requires=kr *)
var a = 9;
var f = { :b |
	LfNoise2(b.Sign).ExpRange(9, b)
};
Splay(
	LeakDc(
		Formant(
			[
				({ a := a + 7 } ! 6).MidiCps,
				({ f(99).RoundTo(12) } ! 6).MidiRatio
			].product,
			{ f(2200) } ! 6,
			{ f(300) } ! 6
		) * SinOscFb(
			f(0.05),
			{ f(0.5) } ! 6
		).kr,
		0.995
	)
) / 13
