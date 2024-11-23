/* Sample and hold liquidities (Jmcc) #4 ; requires=keywords */
let r = MouseX(
	minVal: 1,
	maxVal: 200,
	warp: 1,
	lag: 0.1
);
let t = r.Recip;
let c = Impulse(
	freq: r,
	phase: 0
) * 0.4;
let cf = MouseY(
	minVal: 100,
	maxVal: 8000,
	warp: 1,
	lag: 0.1
);
let f = Latch(
	in: WhiteNoise() * cf * 0.5 + cf,
	trig: c
);
let p = Latch(
	in: WhiteNoise(),
	trig: c
);
let i = EqPan2(
	in: SinOsc(
		freq: f,
		phase: 0
	),
	pos: p
) * Decay2(
	in: c,
	attackTime: 0.1 * t,
	decayTime: 0.9 * t
);
CombN(
	in: i,
	maxDelayTime: 0.3,
	delayTime: 0.3,
	decayTime: 2
)
