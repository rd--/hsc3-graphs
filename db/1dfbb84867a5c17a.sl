(* jmcc - ostinoodles ; requires=keywords *)
var z = { :tr |
	var sequ = { :list :trig |
		Demand(
			trig: trig,
			reset: 0,
			demandUgens: Dseq(
				repeats: inf,
				list: list
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
		bufNum: major,
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
		sequence.MidiCps,
		trig
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
}.OverlapTexture(6, 3, 6).Mix;
6.timesRepeat {
	z := AllpassN(
		in: z,
		maxDelayTime: 0.04,
		delayTime: {
			Rand(
				lo: 0,
				hi: 0.04
			)
		} ! 2,
		decayTime: 16)
};
z
