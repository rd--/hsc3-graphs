{- MembraneCircle ; event control ; note limited voice count ; requires=keywords -}
Voicer(
	part: 1,
	numVoices: 6,
	voiceFunc: { :e |
		let loss = LinExp(
			in: e.y,
			srcLo: 0,
			srcHi: 1,
			dstLo: 0.99999,
			dstHi: 0.99950
		);
		let wobble = SinOsc(
			freq: 2,
			phase: 0
		);
		let tension = LinExp(
			in: e.x,
			srcLo: 0,
			srcHi: 1,
			dstLo: 0.01,
			dstHi: 0.1
		) + (wobble * 0.0001);
		let env = Perc(
			trig: e.w,
			attackTime: 0.0001,
			releaseTime: 1 - e.z,
			curve: -4
		) * (e.z + (e.y / 4));
		EqPan2(
			in: MembraneCircle(
				excitation: PinkNoise() * env,
				tension: tension,
				loss: loss
			),
			pos: e.i * 2 - 1
		)
	}
).Mix
