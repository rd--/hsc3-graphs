// lf pulses (rd)
var x = MouseX.kr(0.012, 0.19, 1, 0.1) + (LFNoise2(0.2) * 0.1 + 0.05);
var f = Formlet.ar(Blip.ar(10, 12), LFNoise0.ar(#[20, 40]) * 43 + 700, 0.005, x);
var o = SinOsc.ar(40, 0) * LFNoise0.ar(#[5, 10]);
LeakDC.ar(f + o, 0.995).clip2(0.75)
