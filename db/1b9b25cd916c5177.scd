// thestart (modified)
var amp = 0.2, ampLagTime = 5, freq = 1000, pos = 1, posLagTime = 30;
var gen = { HPF.ar(BPF.ar(PinkNoise.ar() * Line.kr(0, amp, ampLagTime), [450, 250, 150], 0.2), LFNoise2.ar([0.1, 0.11, 0.14]).range(100,800)) };
var src = gen.dup(3).sum.splay2;
XFade2.ar(src,LPF.ar(src, freq), Line.kr(0, pos, posLagTime));
