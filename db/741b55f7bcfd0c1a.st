"sinOsc ; event control"
| f |
f := [ :e |
	Pan2 in: (SinOsc freq: (e x * 24 + 48) midiCps phase: 0) pos: e o * 2 - 1 level: e z * e w * 0.5
].
(Voicer numVoices: 16 voiceFunc: f) sum
