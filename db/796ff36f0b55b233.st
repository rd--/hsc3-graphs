"RBezier - mouse control of frequency"
| x |
x := MouseX minval: 40 maxval: 4000 warp: 1 lag: 0.2.
RBezier haltAfter: 100 dx: 0.0001 freq: x phase: 0 param: #(0 0 0.2 -1.3 0.3 -1.3 0.5 0 0.7 1.3 0.8 1.3 1 0) mul: 0.1
