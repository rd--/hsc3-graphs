// DFM1
var in = Pulse.ar([100, 100.1], 0.5).sum * 0.4;
var freq = SinOsc.kr(SinOsc.kr(0.3, 0).range(0.2, 5), 0).range(80, 2000);
DFM1.ar(in, freq, 1.1, 2, 0, 0.0003) * 0.2
