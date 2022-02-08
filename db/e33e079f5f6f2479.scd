// GrainSin
var overlap = MouseY.kr(0, 2, 0, 0.2);
var f = MouseX.kr(1, 220, 0, 0.2);
var t = Impulse.ar(f, 0);
var a = GrainSin.ar(2, t, overlap / f, 440, 0, -1, 512);
LeakDC.ar(a, 0.995) * 0.1
