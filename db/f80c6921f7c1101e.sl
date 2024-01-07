let freq = Sequencer(
	[60 62 63 58 48 55],
	LfPulse(6, 0, 0.5)
).MidiCps;
LfSaw(freq, 0) * 0.1
