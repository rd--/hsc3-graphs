(* Env ; asEnvGen *)
var levels = [440 440 324 10000];
var times = [4 2 1];
var curves = 2;
var env = Env(levels, times, curves, nil, nil, 0);
var freq = env.asEnvGen(1);
SinOsc(freq, 0) * 0.1
