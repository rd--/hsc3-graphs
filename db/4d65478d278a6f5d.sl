/* Sequencer ; Jmcc */
let clock = Impulse(8, 0);
let trig1 = ImpulseSequencer([0.4 0.1 0.2 0.1], clock);
let root = Sequencer([24 26 24 22], PulseDivider(clock, 64, 0));
let x = Rlpf(
	GrayNoise(0.4 # 2, 0) * Decay2(trig1, 0.005, 0.7),
	MouseX(200, 8000, 1, 0.2),
	0.2
).Distort;
let trig2 = ImpulseSequencer([0.4 0 0.1 0.1 0.4 0.1 0.1 0.1], clock);
let freq = (Sequencer([33 33 35 36 45 47 38 40 33 33 35 36 47 48 50 52], clock) + root).MidiCps;
let z = VarSaw(freq * [1, 1.505], 0, MouseY(0, 1, 0, 0.2)) * Decay2(trig2, 0.005, 1.4);
CombN(x + z * 0.5, 0.26, 0.26, 4).SoftClip
