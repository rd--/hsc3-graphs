"envASR ; random release time"
| g e |
g := SetResetFF trig: 1 reset: (Dust density: 1).
e := EnvASR attackTime: 0.01 sustainLevel: 0.1 releaseTime: 1 curve: -4.
SinOsc freq: 440 phase: 0 mul: (e asEnvGen: g withDoneAction: 2) kr