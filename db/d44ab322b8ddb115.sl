(* tutorial 3.4 ; ? *)
let env = Env([63 63 60 55 60], [0.125], [0], nil, nil, 0).asArray;
SinOsc(EnvGen(Impulse(2, 0), 1, 0, 1, 0, env).MidiCps, 0) * 0.1
