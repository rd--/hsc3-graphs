"envPerc"
| e |
e := EnvPerc attackTime: 0.01 releaseTime: 1 level: 0.1 curves: #(-4 -4).
SinOsc freq: 440 phase: 0 mul: (e envGen: 1 doneAction: 2) kr