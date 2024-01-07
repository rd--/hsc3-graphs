(* LocalOut ; resonator, must subtract blockSize for correct tuning *)
let p = LocalIn(1, 0);
let i = Impulse(1, 0);
let d = DelayC(i + (p * 0.995), 1, 440.reciprocal - ControlDur());
[p <! LocalOut(d), SinOsc(440, 0) * 0.05]
