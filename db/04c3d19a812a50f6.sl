let freq = Sequencer(
	[60 62 63 58 48 55],
	Dust(6)
).MidiCps;
LfSaw(freq, 0) * 0.1
