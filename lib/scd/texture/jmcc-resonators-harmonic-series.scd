// resonators harmonic series (jmcc) #2
{
	var p = 12; // number of overtones
	var noise = BrownNoise.ar * 0.001;
	var rat = #[1.0, 1.125, 1.25, 1.333, 1.5, 1.667, 1.875, 2.0, 2.25, 2.5, 2.667, 3.0, 3.333, 3.75, 4.0]; // just diatonic scale
	var freq0 = rat.choose * 120;
	var frequencies = (1 .. p).collect { |i| i * freq0 + 0.5.rand2 };
	var amplitudes = (1 .. p).collect { |i| 1 / i };
	var ringtimes = { 0.5 + 4.0.rand }.dup(p);
	{ RingzBank.ar(noise, frequencies, amplitudes, ringtimes) }.dup(2)
}.xfade(1, 7)
