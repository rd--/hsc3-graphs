let freq = MouseX(300, 15000, 1, 0.2);
let osc = SinOsc(freq, 0) * 0.1;
[osc, osc * AmpComp(freq, 300, 1 / 3).kr]
