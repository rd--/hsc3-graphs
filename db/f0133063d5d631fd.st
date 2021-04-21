"SinOsc ; mouse control"
| x y |
x := MouseX minval: 40 maxval: 10000 warp: 1 lag: 0.2.
y := MouseY minval: 0.01 maxval: 0.25 warp: 1 lag: 0.2.
SinOsc freq: x phase: 0 mul: y
