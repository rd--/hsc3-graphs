"EnvADSR ; mouse button control"
| g e |
g := MouseButton minval: 0 maxval: 1 lag: 0.2.
e := EnvADSR attackTime: 0.75 decayTime: 1.75 sustainLevel: 0.35 releaseTime: 3.25 peakLevel: 1 curve: -4.
SinOsc freq: 440 phase: 0 mul: (EnvGen gate: g levelScale: 0.1 levelBias: 0 timeScale: 1 doneAction: 0 envelope: e asEnvSpec coord)
