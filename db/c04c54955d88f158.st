"EnvSpec ; FM"
SinOsc
  freq: (SinOsc freq: 10 phase: 0) * 10 + 440
  phase: 0
  mul: ((EnvSpec levels: #(0.5 0) times: #(1)) asEnvGen: 1 withDoneAction: 2) kr
