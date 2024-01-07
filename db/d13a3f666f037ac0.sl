let gate = LfPulse(MouseX(0.2, 20, 1, 0.2) ,0, MouseY(0.01, 0.99, 0, 0.2));
let env = Env([0, 0.1, 0.1, 0], [0.001, 0.2, 0.3], -4, 2, nil, 0);
SinOsc(440, 0) * EnvGen(gate, 1, 0, 1, 0, env.asArray)
