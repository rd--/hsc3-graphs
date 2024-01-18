{- LinGen -}
let env = LinGen(Impulse(4, 0), [0 1 1 0], [0.001 0.05 0.1]);
SinOsc(440 * env, 0) * 0.1
