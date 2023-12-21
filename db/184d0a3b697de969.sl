(* 12 May 2020 ; https://github.com/lukiss/Losers-Union-SC-Research *)
var l = { :freq :mul |
	(LfdNoise3(freq) * mul).Abs
};
var i = 1 / 16;
var t = Impulse(l(pi, pi), 0);
CombC(
	{
		SinOsc(
			Demand(
				t,
				0,
				Drand(inf, [9 .. 42].degreeToKey([0 2 4 7 9], pi * pi))
			).MidiCps,
			0
		) * (t.Lag3Ud(0, i) + (t.Lag3Ud(i + l(9, i * 4), l(pi, pi)) / pi))
	} !^ 5,
	i,
	i,
	pi
) / 3
