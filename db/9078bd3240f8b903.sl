(* 9 Jan 2019 ; https://github.com/lukiss/Losers-Union-SC-Research *)
var a = 40;
var f = { :b |
	LfNoise1(1).ExpRange(10, b)
};
Splay(
	LeakDc(
		Formant(
			[
				({ a := a + 5 } ! 6).MidiCps,
				({ f(29).RoundTo(7) } ! 6).MidiRatio
			].product,
			{ f(1000) } ! 6,
			{ f(500) } ! 6
		),
		0.995
	)
) / 5
