// DustRange ; velvet noise (approx.)
var iot = 20 / SampleRate.ir();
var x = MouseX.kr(1, 16, 1, 0.1);
var d = DustRange.ar(iot / x, iot * x);
var s = TRand.ar(-1, 1, d);
Trig.ar(d, SampleDur.ir()) * s.sign * 0.1
