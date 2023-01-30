"envAsr ; random release time"
| g e |
g := SetResetFf trig: 1 reset: (Dust density: 1).
e := EnvAsr attackTime: 0.01 sustainLevel: 0.1 releaseTime: 1 curves: -4.
SinOsc freq: 440 phase: 0 mul: (e asEnvGen: g withDoneAction: 2) kr
