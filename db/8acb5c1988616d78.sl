(* tutorial 2.4 ; pm ; equivalent *)
var modFreq = MouseX(1,1000, 1, 0.2);
var modIndex = MouseY(0.0, 100.0, 0, 0.2);
var conversion = 2 * pi / SampleRate();
SinOsc(440, (modFreq * modIndex * conversion * SinOsc(modFreq, 0))) * 0.25
