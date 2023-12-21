(* tutorial 2.4 ; pm *)
var modFreq = MouseX(1,1000, 1, 0.2);
var modIndex = MouseY(0.0, 100.0, 0, 0.2);
var conversion = 2 * pi / SampleRate();
var phase = Phasor(0, 440 * conversion, 0, 2 * pi, 0) + (modFreq * modIndex * conversion * SinOsc(modFreq, 0));
SinOsc(0, phase) * 0.25
