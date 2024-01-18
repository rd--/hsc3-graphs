{- MVerb ; static ; requires=keyword -}
let in = Resonz({ Dust([0.3, 0.33]) } ! 3, 3333, 0.01).Sum * 33;
MVerb(
	in1: in[1],
	in2: in[2],
	dampingFreq: 0.1,
	density: 0.5,
	bandwidthFreq: 0.9,
	decay: 0.5,
	preDelay: 0.1,
	size: 0.6,
	gain: 1,
	mix: 0.5,
	earlyMix: 0.5
)
