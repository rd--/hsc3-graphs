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

// coolant (jmcc)
{
	var r = Ref([{40 + 2000.0.rand} ! 10, nil, nil]);
	{
		Klank.ar(r, OnePole.ar(BrownNoise.ar * 0.002, 0.95), 1, 0, 1)
	} ! 2
}

//---- coolant (jmcc)
var p = 10;
var s1 = [Array.fill(p, {40 + 2000.0.rand}),nil,nil];
var s2 = [Array.fill(p, {40 + 2000.0.rand}),nil,nil];
Klank.ar([Ref(s1), Ref(s2)], OnePole.ar(BrownNoise.ar([0.002, 0.002]), 0.95), 1, 0, 1)
