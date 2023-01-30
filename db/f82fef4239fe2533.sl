;; SinOsc ; simple fm ; modIndex
var modFreq = MouseX(1, 1000, 1, 0.2);
var modIndex = MouseY(0, [7, 11], 0, 0.2);
var modDev = modFreq * modIndex;
var modOsc = SinOsc(modFreq, 0) * modDev;
var carFreq = 440;
var carAmp = 0.1;
SinOsc(carFreq + modOsc, 0) * carAmp
