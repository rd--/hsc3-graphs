(* sample and hold liquidities (jmcc) #4 ; requires=keywords *)
var r = MouseX(
	minVal: 1,
	maxVal: 200,
	warp: 1,
	lag: 0.1
);
var t = r.Recip;
var c = Impulse(
	freq: r,
	phase: 0
) * 0.4;
var cf = MouseY(
	minVal: 100,
	maxVal: 8000,
	warp: 1,
	lag: 0.1
);
var f = Latch(
	in: WhiteNoise() * cf * 0.5 + cf,
	trig: c
);
var p = Latch(
	in: WhiteNoise(),
	trig: c
);
var i = EqPan2(
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
