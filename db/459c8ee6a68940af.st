"EnvAdsr ; random release time"
| g e |
g := SetResetFf trig: 1 reset: (Dust density: 1).
e := EnvAdsr attackTime: 0.01 decayTime: 0.25 sustainLevel: 0.15 releaseTime: 0.75 peakLevel: 0.1 curves: -4.
SinOsc freq: 440 phase: 0 mul: (e asEnvGen: g withDoneAction: 2) kr
