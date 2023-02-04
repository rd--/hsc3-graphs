// https://twitter.com/luuma/status/656913884440301568
DFM1.ar(
	in: Saw.ar((100, 100.9 .. 110)).mean,
	freq: PMOsc.ar(100, 300, 0.4, 0).exprange(300, 9800),
	res: 0.9,
	inputgain: 1,
	type: 0,
	noiselevel: 0.0003
).dup(2) * SoundIn.ar(0)
