(* SinOsc ; simple fm *)
var modFreq = MouseX(1, 1000, 1, 0.2);
var modDev = MouseY(0, [100, 700], 0, 0.2);
var modOsc = SinOsc(modFreq, 0) * modDev;
var carFreq = 400;
var carAmp = 0.1;
SinOsc(carFreq + modOsc, 0) * carAmp
