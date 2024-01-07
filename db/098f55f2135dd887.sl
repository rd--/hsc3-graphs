(* tutorial 2.4 ; fm *)
let carFreq = 440;
let harmonicity = MouseX(0, 10, 0, 0.2).RoundTo(1);
let modIndex = MouseY(0.0, 10.0, 0, 0.2);
let modFreq = carFreq * harmonicity;
SinOsc(carFreq + (SinOsc(modFreq, 0) * modFreq * modIndex), 0.0) * 0.1
