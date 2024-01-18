{- tutorial 2.4 ; pm -}
let modFreq = MouseX(1,1000, 1, 0.2);
let modIndex = MouseY(0.0, 100.0, 0, 0.2);
let conversion = 2 * pi / SampleRate();
let phase = Phasor(0, 440 * conversion, 0, 2 * pi, 0) + (modFreq * modIndex * conversion * SinOsc(modFreq, 0));
SinOsc(0, phase) * 0.25
