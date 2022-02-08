"EnvSine ; trigger ; mouse button control"
| tr e |
tr := MouseButton minval: 0 maxval: 1 lag: 0.2.
e := (EnvSine dur: 1 level: 0.1) asEnvGen: tr.
SinOsc freq: (TRand lo: 220 hi: #(330 440) trig: tr) phase: 0 mul: e
