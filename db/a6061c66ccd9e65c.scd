// Sequencer ; jmcc
var p = Dseq.dr([
	Dseq.dr([24, 24, 24, 24, 26, 26, 26, 26, 27, 27, 27, 27, 26, 26, 26, 22] + 12, 3),
	Dseq.dr([24, 24, 24, 24, 26, 26, 26, 26, 27, 27, 27, 27, 26, 26, 26, 27] + 12, 1),
	Dseq.dr([29, 29, 29, 29, 27, 27, 27, 27, 29, 29, 29, 29, 30, 30, 30, 30] + 12, 3),
	Dseq.dr([29, 29, 29, 29, 27, 27, 27, 27, 29, 29, 29, 29, 30, 30, 30, 24] + 12, 1),
	Dseq.dr([24, 24, 24, 24, 26, 26, 26, 26, 27, 27, 27, 27, 26, 26, 26, 22] + 14, 3),
	Dseq.dr([24, 24, 24, 24, 26, 26, 26, 26, 27, 27, 27, 27, 26, 26, 26, 19] + 14, 1),
	Dseq.dr([24, 24, 24, 24, 26, 26, 26, 26, 27, 27, 27, 27, 26, 26, 26, 22] + 11, 3),
	Dseq.dr([24, 24, 24, 24, 26, 26, 26, 26, 27, 27, 27, 27, 26, 26, 26, 23] + 11, 1)
], inf);
var clock = Impulse.kr(12, 0);
var trig = ImpulseSequencer.kr([0.3, 0.1, 0.2, 0.1],  clock);
var env = Decay2.kr(trig, 0.005, 0.15) * 0.3;
var w;
var x = { PinkNoise.ar } ! 2 * 2 * env;
var y;
var z = LinExp.kr(LFTri.kr(0.2, 0), -1, 1, 1 / 18000, 1 / 50); // flanger lfo
var freq;
3.timesRepeat { // delays
	x = DelayL.ar(x, 0.1, z) + x
};
x = RLPF.ar(x, MouseY.kr(200, 8000, 0, 0.2), 0.2, 0.6).distort;
trig = PulseDivider.kr(clock, 2, 0);
freq = Sequencer.kr(p, trig).midiCps;
env = Decay2.kr(trig, 0.002, 2) * 0.6;
y = RLPF.ar(LFSaw.ar(freq * [1, 1.505], 0, env * 8), MouseX.kr(100, 8000, 1, 0.2) * (1 + env), 0.1).distort * 0.08;
x = CombN.ar(x + y, 0.33, 0.33, 2) * 0.5 + x;
w = x;
4.do {
	w = AllpassN.ar(w, 0.05, { Rand(0, 0.03) } ! 2, 4)
};
w
