/* Sequencer ; Jmcc */
let p = Drand(inf, [
	Dseq(1, [0 0 1 2 7 8 9 8 10 10 1 2 1 2 3 4 0 0 1 2 7 8 9 8 11 11 1 2 1 2 3 4]),
	Dseq(2, [0 0 1 2 7 8 3 4 0 0 1 2 1 2 3 4 0 0 1 2 7 8 3 4 0 0 1 2 1 2 3 4])
]);
let clock = Impulse(12, 0);
let root = Sequencer([57, 59, 62, 55], PulseDivider(clock, 128, 0));
let trig1 = ImpulseSequencer(
	[1 0 0 0 1 0 0 1 1 0 0 0 1 0 0 1 1 0 0 0 1 0 0 1 1 0 1 0 1 0 1 1],
	PulseDivider(clock, 2, 0)
);
let r = Lpf(
	Rlpf(
		BrownNoise(1 # 2, 0) * Decay2(trig1, 0.005, 0.7) * 3,
		MouseX(200, 300, 1, 0.2),
		0.4
	).Distort,
	800
);
let trig2 = ImpulseSequencer([0.4 0.1 0.2 0.1], clock);
let x = Rlpf(
	GrayNoise(0.4 # 2, 0) * Decay2(trig2, 0.005, 0.3),
	MouseX(200, 8000, 1, 0.2),
	0.2
).Distort;
let scale = [0 2 3 5 7 8 10].asLocalBuf;
let trig3 = ImpulseSequencer([0.4 0 0.1 0.1 0.4 0.1 0.1 0.1] * 1.5, clock);
let freq = (DegreeToKey(scale, Demand(clock, 0, p), 12) - 12 + root).MidiCps;
let z = Rlpf(
	VarSaw(freq * [1, 1.505], 0, MouseY(0, 1, 0, 0.2)) * Decay2(trig3, 0.005, 0.8),
	MouseX(200, 8000, 1, 0.2),
	0.2
).Distort;
let trig4 = ImpulseSequencer(
	[1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1] * 0.2,
	clock
);
let y = SinOsc((root + 24).MidiCps, 0) * Decay2(trig4, 0.005, 0.2);
let trig5 = ImpulseSequencer(
	[1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1] * 0.3,
clock);
let w = SinOsc((root + 24 + 7).MidiCps, 0) * Decay2(trig5, 0.005, 0.2);
let snd = (r * 0.1 + x + z + [y, w]) * 0.4;
(CombN(snd, 0.51, 0.51, 4) * 0.4 + snd.reversed).SoftClip
