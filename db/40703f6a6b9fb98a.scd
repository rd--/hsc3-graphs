// LocalBuf ; https://sccode.org/1-5fx
var t = { 0.08.rand2 }.dup(1024).asLocalBuf;
var e = SinOsc.kr(0.5 * LFNoise1.kr(10) * 0.2 + 1, 0) * 0.1 + 1.05;
Pan2(RHPF.ar(LPF.ar(Osc.ar(t, 0.05, 0), 400), 500, 0.76), 0, e)
