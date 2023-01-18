// coolant ; jmcc #2
var f = {
	arg tr;
	Splay2.ar(
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
				mul: 0.2,
				add: 0
			)
		} ! 10,
		mul: 1,
		add: 0
	)
};
OverlapTexture.ar(
	graphFunc: f,
	sustainTime: 6,
	transitionTime: 6,
	overlap: 3
)

// coolant (jmcc) #2
{
	var p = 10;
	var exc = OnePole.ar({ BrownNoise.ar } ! 2 * 0.002, 0.95);
	{ RingzBank.ar(exc, { 40 + 2000.0.rand } ! p, nil, nil) } ! 2
}.xfade(4, 4)

// coolant (jmcc) #2
{
	var p = 10;
	var f = [
		`[Array.fill(p, { 40 + 2000.0.rand }), nil, nil],
		`[Array.fill(p, { 40 + 2000.0.rand }), nil, nil]
	];
	Klank.ar(f, OnePole.ar(BrownNoise.ar([0.002, 0.002]), 0.95))
}.xfade(4, 4)
