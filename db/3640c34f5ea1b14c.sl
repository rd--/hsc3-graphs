{- EnvGen ; curve=3=sin -}
let trg = Impulse(1 / 9, 0);
let env = Env([0, 0.1, 0.1, 0], [3, 2, 3], 3, nil, nil, 0);
SinOsc(440, 0) * EnvGen(trg, 1, 0, 1, 0, env.asArray)
