"EnvLinen"
|e|
e := EnvLinen attackTime: 0.4 sustainTime: 2 releaseTime: 0.4 level: 0.1 curves: #(lin lin lin) .
SinOsc freq: 440 phase: 0 mul: (e envGen: 1 doneAction: 2) kr
