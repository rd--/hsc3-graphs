;; resonz ; pinkNoise ; event control ; keywords
var f = { :e |
	Pan2(in: Resonz(in: PinkNoise(), freq: (e.p * 127 + e.px).MidiCps, bwr: e.y * 0.25) * 24, pos: e.o * 2 - 1, level: e.z.Squared * e.w)
};
Voicer(numVoices: 16, voiceFunc: f).sum
