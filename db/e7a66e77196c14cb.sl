{ :tr |
	{
		var a = { TRand(30, 80, tr) } ! 32;
		var cycle = a.size * 0.5;
		Saw(
			Select(
				LfSaw(1, 0) * cycle + cycle,
				a.MidiCps
			)
		) * 0.2
	} ! 2
}.XFadeTexture(3, 4)
