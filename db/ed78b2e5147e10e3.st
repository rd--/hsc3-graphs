"EnvSine"
| e |
e := EnvSine dur: 9 level: 0.1.
SinOsc freq: 440 phase: 0 mul: (e asEnvGen: 1 withDoneAction: 2) kr
