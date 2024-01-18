{- SinOsc ; simple fm ; modIndex -}
let modFreq = MouseX(1, 1000, 1, 0.2);
let modIndex = MouseY(0, [7, 11], 0, 0.2);
let modDev = modFreq * modIndex;
let modOsc = SinOsc(modFreq, 0) * modDev;
let carFreq = 440;
let carAmp = 0.1;
SinOsc(carFreq + modOsc, 0) * carAmp
