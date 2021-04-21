"Dseq ; at control rate"
| n x t f |
n := Dseq repeats: 3 list: #(1 3 2 7 8) mce.
x := MouseX minval: 1 maxval: 40 warp: 1 lag: 0.1.
t := Impulse freq: x phase: 0.
f := Demand trig: t reset: 0 demandUGens: n mul: 30 add: 340.
SinOsc freq: (f kr) phase: 0 mul: 0.1
