(* blip ; event control ; requires=keywords *)
Voicer(
	part: 1,
	numVoices: 16,
	voiceFunc: { :e |
		EqPan2(
			in: Blip(
				freq: e.p.UnitCps,
				numHarm: e.y * 10 + 1
			),
			pos: e.i * 2 - 1
		) * e.w * e.z * e.z
	}
).Sum
