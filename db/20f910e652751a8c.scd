// https://scsynth.org/t/6989/16 ; tm
var num = 25;
var dur = 1 / 60;
var osc = {
	var freq = Rand(30, 5000) * (SinOsc.kr(LFNoise1.kr(dur / 6).range(30, 1000), 0) * LFNoise1.kr(dur).range(0.01, 8)).midiratio;
	var sig = Select.ar(LFNoise0.kr(dur).range(0, 2).round, [SinOsc.ar(freq, 0), Saw.ar(freq), Pulse.ar(freq, 0)] * 0.1);
	var filtFreq = Rand(30, 1000) * LFNoise1.kr(dur).range(1, 5);
	var filt = Select.ar(LFNoise0.kr(dur).range(0, 2).round, [LPF.ar(sig, filtFreq), HPF.ar(sig, filtFreq), BPF.ar(sig, filtFreq, 1)]);
	CombL.ar(sig, 0.5, LFNoise1.kr(dur / 6).range(0.02, 0.5), Rand(0.3, 2));
} ! num;
var sig = Splay.ar(osc, 1, 1, 0, true);
FreeVerb2.ar(sig[0], sig[1], LFNoise1.kr(dur).range(0, 1), LFNoise1.kr(dur * 3).range(0.2, 2), 0.5)
