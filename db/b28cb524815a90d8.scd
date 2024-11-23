// Cf. Duty
var freq = LFNoise2.ar(1).linlin(-1, 1, 111, 555);
var latchFreq = Duty.ar(MouseX.kr(0.1, 1, 1, 0.2), 0, freq);
SinOsc.ar([freq, latchFreq], 0) * 0.1
