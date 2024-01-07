(* Phasor ; phase modulation ; mouse control *)
let carFreq = 440;
let modFreq = MouseX(1, 1000, 1, 0.2);
let modIndex = MouseY(0, 100, 0, 0.2);
let modDev = modFreq * modIndex;
let rateConversion = 2 * pi / SampleRate();
let phase = Phasor(0, carFreq * rateConversion, 0, 2 * pi, 0);
let phaseOffset = SinOsc(modFreq, 0) * modDev * rateConversion;
[SinOsc(0, phase + phaseOffset), SinOsc(carFreq, 0)] * 0.1
