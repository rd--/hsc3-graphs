(* tutorial 2.4 ; fm *)
var modFreq = MouseX(1, 440, 1, 0.2);
var modIndex = MouseY(0.0, 10.0, 0, 0.2);
SinOsc(SinOsc(modFreq,0) * modFreq * modIndex + 440, 0) * 0.25
