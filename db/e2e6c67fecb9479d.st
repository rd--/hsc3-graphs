"EnvLinen ; trigger ; mouse button control"
| tr e |
tr := MouseButton minval: 0 maxval: 1 lag: 0.
e := EnvLinen attackTime: 0.1 sustainTime: 0.1 releaseTime: 4 level: 1 curve: #lin.
SinOsc freq: (TRand lo: 110 hi: #(330 440) trig: tr) phase: 0 mul: (e asEnvGen: tr) * 0.1
