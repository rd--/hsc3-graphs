// ln 2021-04-05 https://lukasnowok.github.io/spectrology/
(SinOsc.ar(10000, mul:Array.geom(4,0.01,8)) *
SinOsc.ar(LFSaw.ar(Array.geom(4, 0.05, 2), mul: Array.geom(4, 1000, 2)))).sum *
4.reciprocal * 0.1
