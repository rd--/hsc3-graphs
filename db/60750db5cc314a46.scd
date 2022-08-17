// PMOsc ; carrier and modulator not linked
var tr = Impulse.kr(10, 0);
var c = TRand.kr(100, 5000, tr);
var m = TRand.kr(100, 5000, tr);
PMOsc.ar(c, m, 12, 0) * 0.1
