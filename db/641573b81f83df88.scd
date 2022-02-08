// nc ; https://composerprogrammer.com/teaching/supercollider/sctutorial/tutorial.html 3.4
var t = MouseY.kr(0, 1, 0, 0.2) * #[0, 128, 256, 128] / SampleRate.ir;
var e = Env(#[0, 0, 1, -1, 0], t, #[\lin], nil, nil, 0);
EnvGen.ar(e, Impulse.ar(MouseX.kr(10, 300, 1, 0.2), 0), 1, 0, 1, 0) * 0.2
