// Sequencer ; Jmcc
var clock = Impulse.kr(
	freq: 8,
	phase: 0
);
var trig1 = ImpulseSequencer.kr(
	inArray: [0.4, 0.1, 0.2, 0.1],
	trig: clock
);
var root = Sequencer.kr(
	inArray: [24, 26, 24, 22],
	trig: PulseDivider.kr(trig: clock, div: 64, start: 0)
);
var x = RLPF.ar(
	in: Decay2.kr(
		in: trig1,
		attackTime: 0.005,
		decayTime: 0.7
	) * { GrayNoise.ar() } ! 2 * 0.4,
	freq: MouseX.kr(
		minval: 200,
		maxval: 8000,
		warp: 1,
		lag: 0.2
	),
	rq: 0.2
).distort;
var trig2 = ImpulseSequencer.kr(
	inArray: [0.4, 0.0, 0.1, 0.1, 0.4, 0.1, 0.1, 0.1],
	trig: clock
);
var freq = (Sequencer.kr(
	inArray: [33, 33, 35, 36, 45, 47, 38, 40, 33, 33, 35, 36, 47, 48, 50, 52],
	trig: clock
) + root).midiCps;
var z = VarSaw.ar(
	freq: freq * [1, 1.505],
	iphase: 0,
	width: MouseY.kr(0, 1, 0, 0.2)
) * Decay2.kr(
	in: trig2,
	attackTime: 0.005,
	decayTime: 1.4
);
CombN.ar(
	in: x + z * 0.5,
	maxdelaytime: 0.26,
	delaytime: 0.26,
	decaytime: 4
).softclip
