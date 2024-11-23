/* Resonz ; PinkNoise ; Event control ; requires=keywords */
Voicer(
	part: 1,
	numVoices: 16,
	voiceFunc: { :e |
		EqPan2(
			in: Resonz(
				in: PinkNoise(),
				freq: (e.x * 24 + 48).MidiCps,
				bwr: e.y * 0.25
			) * 24,
			pos: e.i * 2 - 1
		) * e.z.Squared * e.w
	}
).Sum
