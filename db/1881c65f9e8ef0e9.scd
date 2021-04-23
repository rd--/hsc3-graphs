// ln 2021-04-08 https://lukasnowok.github.io/spectrology/
{SinOsc.ar(1000 + LFSaw.ar(LFSaw.ar(Array.geom(4, 0.1, 1.5), mul: 5000), mul:500)).sum * 4.reciprocal * 0.1}
