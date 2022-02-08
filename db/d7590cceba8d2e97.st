"EnvPerc ; gate ; mouse button control"
| e g |
e := EnvPerc attackTime: 0.01 releaseTime: 1 level: 0.1 curve: -4.
g := MouseButton minval: 0 maxval: 1 lag: 0.
SinOsc freq: (TRand lo: 220 hi: #(330 440) trig: g) phase: 0 mul: (e asEnvGen: g)
