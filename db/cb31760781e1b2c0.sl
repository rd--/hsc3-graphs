{- tutorial 3.4 ; ? -}
let t = MouseY(0, 1, 0, 0.2) * [0 128 256 128] / SampleRate();
let e = Env([0 0 1 -1 0], t, [1], nil, nil, 0).asArray;
EnvGen(Impulse(MouseX(10, 300, 1, 0.2), 0), 1, 0, 1, 0, e) * 0.2
