/* Env ; asEnvGen */
let levels = [440 440 324 10000];
let times = [4 2 1];
let curves = 2;
let env = Env(levels, times, curves, nil, nil, 0);
let freq = env.asEnvGen(1);
SinOsc(freq, 0) * 0.1
