var genScale = { :ratio |
	(0 .. 11).collect { :each |
		(ratio ^ each).RatioMidi % 12
	}
};
var notes = 48 + genScale(3 / 2);
var amps = { Rand(0, 0.1) } ! 12;
Splay(
	SinOsc(notes.MidiCps, 0) * amps
)
