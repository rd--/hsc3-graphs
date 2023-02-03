;; resonz ; pinkNoise ; event control ; keywords
var f = { :e |
	EqPan2(
		in: Resonz(in: PinkNoise(), freq: (e.x * 24 + 48).MidiCps, bwr: e.y * 0.25) * 24,
		pos: e.o * 2 - 1
	) * e.z.Squared * e.w
};
Voicer(numVoices: 16, voiceFunc: f).Sum
