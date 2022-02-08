// Env.adsr ; mouse as gate input
SinOsc.ar(440, 0) * EnvGen.kr(Env.adsr(0.75, 1.75, 0.35, 3.25, 1, -4, 0), MouseButton.kr(0, 1, 0.2), 0.1, 0, 1, 0)
