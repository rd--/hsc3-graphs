(* SinOsc ; simple fm ; modRatio & carRatio *)
let freq = 440;
let modRatio = MouseX(0.1, 10, 1, 0.2);
let modDev = MouseY(0, 100, 0, 0.2);
let modOsc = SinOsc(freq * modRatio, 0) * modDev;
let carRatio = [1, 1 / 3] / modRatio;
let carAmp = 0.1;
SinOsc(freq * carRatio + modOsc, 0) * carAmp
