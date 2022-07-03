// bugs
var amp = 1.2, ampLagTime = 20, cut_freq = 600, nse = 0.1, n_freq = 800;
var src = { LPF.ar(PinkNoise.ar() * nse, n_freq) * SinOsc.ar(1750, 0) * SinOsc.ar(160, 0) }.dup;
var bugs = PitchShift.ar(src, 0.2, LFTri.ar(20, 0).range(0.9, 5), 0.01, 0.0001);
HPF.ar(Limiter.ar(bugs, 0.9, 0.01) * Line.kr(0, amp, ampLagTime), cut_freq)
