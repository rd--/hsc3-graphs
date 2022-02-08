"EnvLinen"
| e |
e := EnvLinen attackTime: 0.4 sustainTime: 2 releaseTime: 0.4 level: 0.1 curve: #lin.
SinOsc freq: 440 phase: 0 mul: (e asEnvGen: 1 withDoneAction: 2) kr
