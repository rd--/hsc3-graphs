// https://twitter.com/luuma/status/656913884440301568
DFM1.ar(
	Saw.ar((100, 100.9 .. 110)).mean,
	PMOsc.ar(100, 300, 0.4, 0).exprange(300, 9800),
	0.9,
	1,
	0,
	0.0003
).dup(2) * SoundIn.ar(0)
