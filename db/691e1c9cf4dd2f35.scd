// ln 2021-04-17 https://lukasnowok.github.io/spectrology/
((SinOsc.ar(Array.geom(10, 1000, 1.4)) * EnvGen.ar(Env([1, 0, 1], [10, 10], \sin))).sum*0.2) +
((SinOsc.ar(Array.geom(10, 800, 1.4)) * EnvGen.ar(Env([0, 1, 0], [10, 10], \sin))).sum*0.2) +
Pulse.ar(4.reciprocal) * 0.1
