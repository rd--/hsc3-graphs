// Sequencer ; jmcc
var p = Drand.dr([
	Dseq.dr([0, 0, 1, 2, 7, 8, 9, 8, 10, 10, 1, 2, 1, 2, 3, 4, 0, 0, 1, 2, 7, 8, 9, 8, 11, 11, 1, 2, 1, 2, 3, 4], 1),
	Dseq.dr([0, 0, 1, 2, 7, 8, 3, 4, 0, 0, 1, 2, 1, 2, 3, 4, 0, 0, 1, 2, 7, 8, 3, 4, 0, 0, 1, 2, 1, 2, 3, 4], 2)
], inf);
var clock = Impulse.kr(12, 0);
var root = Sequencer.kr([57, 59, 62, 55], PulseDivider.kr(clock, 128, 0));
var trig1 = ImpulseSequencer.kr([1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1], PulseDivider.kr(clock, 2, 0));
var r = LPF.ar(
	RLPF.ar(
		Decay2.kr(trig1, 0.005, 0.7) * { BrownNoise.ar } ! 2 * 3,
		MouseX.kr(200, 300, 1, 0.2),
		0.4
	).distort,
	800
);
var trig2 = ImpulseSequencer.kr([0.4, 0.1, 0.2, 0.1], clock);
var x = RLPF.ar(
	Decay2.kr(trig2, 0.005, 0.3) * { GrayNoise.ar } ! 2 * 0.4,
	MouseX.kr(200, 8000, 1, 0.2),
	0.2
).distort;
var scale = [0, 2, 3, 5, 7, 8, 10].asLocalBuf;
var trig3 = ImpulseSequencer.kr([0.4, 0.0, 0.1, 0.1, 0.4, 0.1, 0.1, 0.1] * 1.5, clock);
var freq = (DegreeToKey.kr(scale, Demand.kr(clock, 0, p), 12) - 12 + root).midiCps;
var z = RLPF.ar(
	VarSaw.ar(freq * [1, 1.505], 0, MouseY.kr(0, 1, 0, 0.2)) * Decay2.kr(trig3, 0.005, 0.8),
	MouseX.kr(200, 8000, 1, 0.2),
	0.2
).distort;
var trig4 = ImpulseSequencer.kr([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1] * 0.2, clock);
var y = SinOsc.ar((root + 24).midiCps, 0) * Decay2.kr(trig4, 0.005, 0.2);
var trig5 = ImpulseSequencer.kr([1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1] * 0.3, clock);
var w = SinOsc.ar((root + 24 + 7).midiCps, 0) * Decay2.kr(trig5, 0.005, 0.2);
var snd = (r * 0.1 + x + z + [y, w]) * 0.4;
(CombN.ar(snd, 0.51, 0.51, 4) * 0.4 + snd.reverse).softclip
