;; Rlpf
var freq = DmdOn(
	Impulse(0.25, 0),
	0,
	Seq(inf, [27, 24, 22, 24] + 2)
).MidiCps + [0, 0.3];
Rlpf(LfPulse(freq, 0, 0.2) * 0.4 - 0.2, 300, 0.5)
