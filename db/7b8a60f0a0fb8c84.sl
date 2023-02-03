;; Sequencer ; jmcc
var p = Lrand(inf, [
	Lseq(1, [0, 0, 1, 2, 7, 8, 9, 8, 10, 10, 1, 2, 1, 2, 3, 4, 0, 0, 1, 2, 7, 8, 9, 8, 11, 11, 1, 2, 1, 2, 3, 4]),
	Lseq(2, [0, 0, 1, 2, 7, 8, 3, 4, 0, 0, 1, 2, 1, 2, 3, 4, 0, 0, 1, 2, 7, 8, 3, 4, 0, 0, 1, 2, 1, 2, 3, 4])
]);
var clock = Impulse(12, 0);
var root = Sequencer([57, 59, 62, 55], PulseDivider(clock, 128, 0));
var trig1 = ImpulseSequencer([1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1], PulseDivider(clock, 2, 0));
var r = Lpf(
	Rlpf(
		{ BrownNoise() } ! 2 * Decay2(trig1, 0.005, 0.7) * 3,
		MouseX(200, 300, 1, 0.2),
		0.4
	).Distort,
	800
);
var trig2 = ImpulseSequencer([0.4, 0.1, 0.2, 0.1], clock);
var x = Rlpf(
	{ GrayNoise() } ! 2 * Decay2(trig2, 0.005, 0.3) * 0.4,
	MouseX(200, 8000, 1, 0.2),
	0.2
).Distort;
var scale = [0, 2, 3, 5, 7, 8, 10].asLocalBuf;
var trig3 = ImpulseSequencer([0.4, 0.0, 0.1, 0.1, 0.4, 0.1, 0.1, 0.1] * 1.5, clock);
var freq = (DegreeToKey(scale, DmdOn(clock, 0, p), 12) - 12 + root).MidiCps;
var z = Rlpf(
	VarSaw(freq * [1, 1.505], 0, MouseY(0, 1, 0, 0.2)) * Decay2(trig3, 0.005, 0.8),
	MouseX(200, 8000, 1, 0.2),
	0.2
).Distort;
var trig4 = ImpulseSequencer([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1] * 0.2, clock);
var y = SinOsc((root + 24).MidiCps, 0) * Decay2(trig4, 0.005, 0.2);
var trig5 = ImpulseSequencer([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1] * 0.3, clock);
var w = SinOsc((root + 24 + 7).MidiCps, 0) * Decay2(trig5, 0.005, 0.2);
var snd = (r * 0.1 + x + z + [y, w]) * 0.4;
(CombN(snd, 0.51, 0.51, 4) * 0.4 + snd.reversed).SoftClip
