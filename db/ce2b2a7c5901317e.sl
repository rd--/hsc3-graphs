(* SinOsc ; https://scsynth.org/t/6264/8 (fm) *)
var freq = 110;
var indexLimit = 1.5;
var index = LinLin(SinOsc(1 / 10, 3 * pi / 2), -1, 1, 1, indexLimit);
var phase = index * LocalIn(1, 1);
var sig = SinOsc(freq, phase) + SinOsc(freq * 0.001, index * LocalIn(1, 1)).SoftClip;
sig <! LocalOut(sig) * 0.1
