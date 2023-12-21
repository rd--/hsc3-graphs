(* LinGen *)
var env = LinGen(1, [2 0.5], [1]);
SinOsc(440 * env, 0) * 0.1
