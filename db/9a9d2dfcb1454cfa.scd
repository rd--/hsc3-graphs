// Slew
var x = MouseX.kr(200, 12000, 1, 0.2);
var y = MouseY.kr(200, 12000, 1, 0.2);
[Slew.ar (0 - Saw.ar(440), x, y) * 0.05, Slew.ar(LFPulse.ar(800, 0, 0.5), x, y) * 0.1]
