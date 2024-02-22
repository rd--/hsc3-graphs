{- Env ; EnvGen -}
let e = Env([440 440 324 10000], [4 2 1], 2, nil, nil, 0);
let f = EnvGen(1, 1, 0, 1, 2, e.asList);
SinOsc(f, 0) * 0.1
