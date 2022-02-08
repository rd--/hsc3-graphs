"SinOsc ; simple bell-like tone"
| f a o e |
f := #(0.5 1.0 1.19 1.56 2.0 2.51 2.66 3.01 4.1) collect: [ :x | x * 500 ].
a := #(0.25 1.0 0.8 0.5 0.9 0.4 0.3 0.6 0.1).
o := SinOsc freq: f phase: 0 mul: a.
e := EnvPerc attackTime: 0.01 releaseTime: 10 level: 0.1 curve: -4.
o mix * (e asEnvGen: 1 withDoneAction: 2)
