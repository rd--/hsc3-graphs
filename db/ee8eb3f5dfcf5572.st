"EnvSpec"
| e |
e := EnvSpec levels: #(0.1 0) times: #(1) curves: #(-4).
SinOsc freq: 440 phase: 0 mul: (e asEnvGen: 1 withDoneAction: 2) kr
