(* tutorial 3.4 ; ? *)
var env = Env([0 1 0 0.5 -0.4], [0.1], [0], nil, nil, 0).asArray;
SinOsc(400 * (1 + EnvGen(Impulse(2.5, 0), 1, 0, 1, 0, env)), 0) * 0.1
