;; jmcc - ostinoodles ; requires=keywords
var z = OverlapTexture({ :tr |
	var sequ = { :s :tr |
		Demand(
			trig: tr,
			reset: 0,
			demandUGens: Dseq(
				repeats: inf,
				list: s
			)
		)
	};
	var root = 81 + TRand(
		lo: -6,
		hi: 6,
		trig: tr
	);
	var major = [0, 2, 4, 5, 7, 9, 11].asLocalBuf;
	var offset = TRand(
		lo: -16,
		hi: 16,
		trig: tr
	);
	var sequence = DegreeToKey(
		bufnum: major,
		in: TScramble(
			trigger: tr,
			inputs: [0, 1, 2, 3] + offset
		),
		octave: 12
	) + root;
	var f = TxLine(
		start: TExpRand(
			lo: 4,
			hi: 24,
			trig: tr
		),
		end: TExpRand(
			lo: 4,
			hi: 24,
			trig: tr
		),
		dur: 12,
		trig: tr
	);
	var trig = Impulse(
		freq: f,
		phase: 0
	);
	var freq = sequ(
		value: sequence.MidiCps,
		value: trig
	);
	var sig = LfTri(
		freq: freq.kr,
		iphase: 0
	) * Decay2(
		in: trig,
		attackTime: 0.004,
		decayTime: 0.3
	).kr * 0.1;
	Pan2(
		in: sig,
		pos: TRand(
			lo: -1,
			hi: 1,
			trig: tr
		),
		level: 1
	)
}, 6, 3, 6);
6.timesRepeat {
	z := AllpassN(
		in: z,
		maxdelaytime: 0.04,
		delaytime: {
			Rand(
				lo: 0,
				hi: 0.04
			)
		} ! 2,
		decaytime: 16)
};
z
