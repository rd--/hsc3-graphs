// Sequencer ; jmcc
var clock = Impulse.kr(8, 0);
var trig1 = ImpulseSequencer.kr([0.4, 0.1, 0.2, 0.1], clock);
var root = Sequencer.kr([24, 26, 24, 22], PulseDivider.kr(clock, 64, 0));
var x = RLPF.ar(
	Decay2.kr(trig1, 0.005, 0.7) * { GrayNoise.ar }.dup(2) * 0.4,
	MouseX.kr(200, 8000, 1, 0.2),
	0.2
).distort;
var trig2 = ImpulseSequencer.kr([0.4, 0.0, 0.1, 0.1, 0.4, 0.1, 0.1, 0.1], clock);
var freq = (Sequencer.kr([33, 33, 35, 36, 45, 47, 38, 40, 33, 33, 35, 36, 47, 48, 50, 52], clock) + root).midiCps;
var z = VarSaw.ar(freq * [1, 1.505], 0, MouseY.kr(0, 1, 0, 0.2)) * Decay2.kr(trig2, 0.005, 1.4);
CombN.ar(x + z * 0.5, 0.26, 0.26, 4).softClip
