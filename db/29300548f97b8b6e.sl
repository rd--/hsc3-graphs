(* tutorial 2.4 ; fm *)
var carFreq = 440;
var harmonicity = MouseX(0, 10, 0, 0.2).RoundTo(1);
var modIndex = MouseY(0.0, 10.0, 0, 0.2);
var modFreq = carFreq * harmonicity;
SinOsc(carFreq + (SinOsc(modFreq, 0) * modFreq * modIndex), 0.0) * 0.1
