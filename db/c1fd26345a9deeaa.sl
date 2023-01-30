;; SinOsc ; simple fm ; modRatio & carRatio
var freq = 440;
var modRatio = MouseX(0.1, 10, 1, 0.2);
var modDev = MouseY(0, 100, 0, 0.2);
var modOsc = SinOsc(freq * modRatio, 0) * modDev;
var carRatio = [1, 1 / 3] / modRatio;
var carAmp = 0.1;
SinOsc(freq * carRatio + modOsc, 0) * carAmp
