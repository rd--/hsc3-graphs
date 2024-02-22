let genScale = { :ratio |
	0:11.collect { :each |
		(ratio ^ each).RatioMidi % 12
	}
};
let notes = 48 + genScale(3 / 2);
let amps = { Rand(0, 0.1) } ! 12;
Splay(
	SinOsc(notes.MidiCps, 0) * amps
)
