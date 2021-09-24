"Dseq ; at audio rate"
| n x t f |
n := Dseq repeats: #dinf list: #(1 3 2 7 8 32 16 18 12 24).
x := MouseX minval: 1 maxval: 10000 warp: 1 lag: 0.1.
t := Impulse freq: x phase: 0.
f := Demand trig: t reset: 0 demandUGens: n mul: 30 add: 340.
SinOsc freq: f phase: 0 mul: 0.1
