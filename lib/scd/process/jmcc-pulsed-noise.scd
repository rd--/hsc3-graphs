// pulsed noise ; jmcc
{
	[
		{
			var amp = (SinOsc.ar(8, 0) * 4).max(0);
			Pan2.ar(
				Resonz.ar(WhiteNoise.ar * amp, ([27, 24, 22, 29, 31] + 62).choose.midiCps, 0.01),
				1.0.rand2,
				1
			)
		},
		0
	].choose.value;
}.overlap(0.2, 3.8, 2)
