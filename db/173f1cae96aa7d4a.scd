// LinSelectX
var f = MouseY.kr(220, 440, 1, 0.2);
var s = [LFTri.ar(f, 0), SinOsc.ar(f, 0), LFPulse.ar(f, 0, 0.5) * 2 - 1];
LinSelectX.ar(MouseX.kr(0, 1, 0, 0.2) * (s.size - 1), s) * 0.1
