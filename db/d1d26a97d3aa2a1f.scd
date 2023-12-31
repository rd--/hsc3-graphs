// FreqShift
var a = Blip.ar(60, 4) * LFGauss.ar(4, 1/8, 0, 1, 0);
var b = a / 4 + LocalIn.ar(2, 0);
var c = FreqShift.ar(b, LFNoise0.kr(1/4) * 90, 0);
c <! LocalOut.ar(DelayC.ar(c, 1, 0.1) * 0.9)
