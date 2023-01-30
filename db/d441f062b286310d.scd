// coolant ; jmcc #2
var f = {
	arg tr;
	Splay.ar(
		inArray: {
			Ringz.ar(
				in: OnePole.ar(
					in: { BrownNoise.ar(mul: 0.002, add: 0) } ! 2,
					coef: 0.95,
					mul: 1,
					add: 0
				),
				freq: TRand.kr(
					lo: 0,
					hi: 2040,
					trig: tr) * 1 + 40,
				decaytime: 1,
				mul: 0.5,
				add: 0
			)
		} ! 10,
	)
};
XFadeTexture(
	graphFunc: f,
	sustainTime: 4,
	transitionTime: 4,
)
