// PMOsc ; modulator expressed as ratio
var carrier = LFNoise0.kr(4) * 500 + 700;
var modRatio = MouseX.kr(1, 2, 0, 0.2);
PMOsc.ar(carrier, carrier * modRatio, 12, 0) * 0.1
