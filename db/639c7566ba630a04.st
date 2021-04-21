"envADSR ; random release time"
| g e |
g := SetResetFF trig: 1 reset: (Dust density: 1).
e := EnvADSR attackTime: 0.01 decayTime: 0.25 sustainLevel: 0.15 releaseTime: 0.75 peakLevel: 0.1 curves: #(-4 -4 -4).
SinOsc freq: 440 phase: 0 mul: (e envGen: g doneAction: 2) kr
