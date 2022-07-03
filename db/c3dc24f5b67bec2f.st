"Seq ; at audio rate"
| n x t f |
n := Seq repeats:  Float infinity list: #(1 3 2 7 8 32 16 18 12 24).
x := MouseX minval: 1 maxval: 10000 warp: 1 lag: 0.1.
t := Impulse freq: x phase: 0.
f := (DmdOn trig: t reset: 0 demandUGens: n) * 30 + 340.
SinOsc freq: f phase: 0 mul: 0.1
