// Storm
var amp = 0.2, ampLagTime = 102, cut = 165, hicut = 440, cutLagTime = 20;
var src = { RLPF.ar(Crackle.ar(1.9 + 0.05.rand), cut.lag(cutLagTime), 1) }.dup(6).sum;
src = HPF.ar(LeakDC.ar(Decay2.ar(src, 0.01, 0.1), 0.995), hicut);
Pan2.ar(Limiter.ar(src, 0.9, 0.1), 0, Line.kr(0, amp, ampLagTime))
