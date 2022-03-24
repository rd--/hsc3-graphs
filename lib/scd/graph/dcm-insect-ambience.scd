// https://scsynth.org/t/insect-ambience/94/ (dcm)

// backgrdhiss
{ HPF.ar(Crackle.ar(1.96), 900) * Vibrato.kr(50.0, 1, 0.02, 0, 0, 0.04, 0.1, 0, 0) * 0.0001 }.dup

// bugs
var amp = 1.2, ampLagTime = 20, cut_freq = 600, nse = 0.1, n_freq = 800;
var src = { LPF.ar(PinkNoise.ar() * nse, n_freq) * SinOsc.ar(1750, 0) * SinOsc.ar(160, 0) }.dup;
var bugs = PitchShift.ar(src, 0.2, LFTri.ar(20, 0).range(0.9, 5), 0.01, 0.0001);
HPF.ar(Limiter.ar(bugs, 0.9, 0.01) * Line.kr(0, amp, ampLagTime), cut_freq)

// frog
Blip.ar([10.001,10], 200) * LFPulse.ar(0.1, 0, 0.5) * 0.02

// thestart (modified)
var amp = 0.2, ampLagTime = 5, freq = 1000, pos = 1, posLagTime = 30;
var gen = { HPF.ar(BPF.ar(PinkNoise.ar() * Line.kr(0, amp, ampLagTime), [450, 250, 150], 0.2), LFNoise2.ar([0.1, 0.11, 0.14]).range(100,800)) };
var src = gen.dup(3).sum.splay2;
XFade2.ar(src,LPF.ar(src, freq), Line.kr(0, pos, posLagTime));

// StaticLoss
var amp = 1, freq = 1200, rq = 1, db = -45, gate = 1, pan = -0.5;
var src = WaveLoss.ar(PinkNoise.ar() * 0.1, 39, 40, 1);
Pan2.ar(BPeakEQ.ar(src, freq, rq, db), pan, amp);

// Storm
var amp = 0.2, ampLagTime = 102, cut = 165, hicut = 440, cutLagTime = 20;
var src = { RLPF.ar(Crackle.ar(1.9 + 0.05.rand), cut.lag(cutLagTime), 1) }.dup(6).sum;
src = HPF.ar(LeakDC.ar(Decay2.ar(src, 0.01, 0.1), 0.995), hicut);
Pan2.ar(Limiter.ar(src, 0.9, 0.1), 0, Line.kr(0, amp, ampLagTime))

// Rumble
var amp = 0.2, lagTime = 120, freq = 240, frq = 490;
var src = LeakDC.ar(Decay2.ar(ClipNoise.ar() * 0.2, 0.01, 0.1), 0.995);
Pan2.ar(LeakDC.ar(LPF.ar(RLPF.ar(src, freq, 1), frq), 0.995), 0, Line.kr(0, amp, lagTime))
