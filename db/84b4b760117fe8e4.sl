(* Sequencer ; jmcc *)
var clock = Impulse(8, 0);
var trig1 = ImpulseSequencer([0.4 0.1 0.2 0.1], clock);
var root = Sequencer([24 26 24 22], PulseDivider(clock, 64, 0));
var x = Rlpf(
	{ GrayNoise() } ! 2 * Decay2(trig1, 0.005, 0.7) * 0.4,
	MouseX(200, 8000, 1, 0.2),
	0.2
).Distort;
var trig2 = ImpulseSequencer([0.4 0 0.1 0.1 0.4 0.1 0.1 0.1], clock);
var freq = (Sequencer([33 33 35 36 45 47 38 40 33 33 35 36 47 48 50 52], clock) + root).MidiCps;
var z = VarSaw(freq * [1, 1.505], 0, MouseY(0, 1, 0, 0.2)) * Decay2(trig2, 0.005, 1.4);
CombN(x + z * 0.5, 0.26, 0.26, 4).SoftClip
