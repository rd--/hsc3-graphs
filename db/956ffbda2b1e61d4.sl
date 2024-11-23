/* SinOsc ; simple fm */
let modFreq = MouseX(1, 1000, 1, 0.2);
let modDev = MouseY(0, [100, 700], 0, 0.2);
let modOsc = SinOsc(modFreq, 0) * modDev;
let carFreq = 400;
let carAmp = 0.1;
SinOsc(carFreq + modOsc, 0) * carAmp
