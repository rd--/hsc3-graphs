// MVerb ; static
var in = Dust.ar(density: [1, 2]);
MVerb.ar(
	in1: in[0],
	in2: in[1],
	dampingFreq: 0.1,
	density: 0.5,
	bandwidthFreq: 0.9,
	decay: 0.5,
	predelay: 0.1,
	size: 0.6,
	gain: 1,
	mix: 0.5,
	earlyMix: 0.5
)
