"resonz ; pinkNoise ; event control"
| f |
f := [ :e |
	| snd |
	snd := Resonz in: PinkNoise new freq: (e p * 127 + e px) midiCps bwr: e y * 0.25 mul: 24.
	Pan2 in: snd pos: e o * 2 - 1 level: e z squared * e w ].
(Voicer numVoices: 16 voiceFunc: f) sum
