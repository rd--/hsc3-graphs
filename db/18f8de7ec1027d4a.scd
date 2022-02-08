// Clip ; https://scsynth.org/t/5208/2 (sp)
var freq = 10;
var osc = SinOsc.ar(freq, 0);
var interp = (MouseX.kr(1, 0, 0, 0.2) ** 8) * 50 + 1;
var sig = Clip.ar(osc * interp, -1, 1) * 0.5 + 0.5;
SinOsc.ar(200 + (sig * 1000), 0) * 0.1
