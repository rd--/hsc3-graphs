(* Schmidt ; threshold octave jumps *)
let in = LfNoise1(3);
let octave = Schmidt(in, [-0.15, -0.1], [0.15, 0.1]) + 1;
SinOsc(in * 200 + 500 * octave, 0) * 0.1
