(* ring modulate input ; jmcc #5 ; requires=AudioIn *)
let input = AudioIn([1, 2]);
let freq = MouseX(10, 4000, 1, 0.2);
let modulator = SinOsc(freq, [0, 0.5 * pi]);
input * modulator
