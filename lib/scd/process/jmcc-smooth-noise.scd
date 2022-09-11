// smooth noise ; jmcc
{
	[
		{
			Pan2.ar(
				Resonz.ar(WhiteNoise.ar * 4, ([27, 24, 22, 29, 31] + 62).choose.midiCps, 0.01),
				1.0.rand2,
				1
			)
		},
		0
	].choose.value;
}.overlap(0.2, 3.8, 2, 2)
