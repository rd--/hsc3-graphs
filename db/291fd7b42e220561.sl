(* pluck ; event control ; requires=keywords *)
Voicer(
	numVoices: 16,
	voiceFunc: { :e |
		var n = WhiteNoise() * e.z * 2;
		var dlMax = 1 / 220;
		var dl = dlMax * (1 - e.x * 0.9);
		EqPan2(
			in: Pluck(
				in: n,
				trig: e.w,
				maxDelayTime: dlMax,
				delayTime: dl,
				decayTime: 10,
				coef: e.y / 3
			),
			pos: e.i * 2 - 1
		)
	}
).Sum
