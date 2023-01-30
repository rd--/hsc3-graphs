;; Env ; asEnvGen
var e = Env([440, 440, 324, 10000], [4, 2, 1], 2, nil, nil, 0);
var f = e.asEnvGen(1);
SinOsc(f, 0) * 0.1
