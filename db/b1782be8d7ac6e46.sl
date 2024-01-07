(* SinOsc ; https://scsynth.org/t/6264/8 (fm) *)
let freq = 110;
let indexLimit = 1.5;
let index = LinLin(SinOsc(1 / 10, 3 * pi / 2), -1, 1, 1, indexLimit);
let phase = index * LocalIn(1, 1);
let sig = SinOsc(freq, phase) + SinOsc(freq * 0.001, index * LocalIn(1, 1)).SoftClip;
sig <! LocalOut(sig) * 0.1
