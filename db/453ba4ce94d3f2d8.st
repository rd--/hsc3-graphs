"Seq ; the SC2 Sequencer UGen is somewhat like the sequ function below"
| sequ t n0 n1 |
sequ := [ :s :tr | DmdOn trig: tr reset: 0 demandUGens: (Seq repeats:  Float infinity list: s) ].
t := Impulse freq: 6 phase: 0.
n0 := sequ value: #(60 62 63 58 48 55) value: t.
n1 := sequ value: #(63 60 48 62 55 58) value: t.
LFSaw freq: {n0. n1} midiCps iphase: 0 mul: 0.05