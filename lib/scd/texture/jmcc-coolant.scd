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
