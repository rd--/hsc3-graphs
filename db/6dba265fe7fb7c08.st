"envPerc"
| e |
e := EnvPerc attackTime: 0.01 releaseTime: 1 level: 0.1 curve: -4.
SinOsc freq: 440 phase: 0 mul: (e asEnvGen: 1 withDoneAction: 2) kr
