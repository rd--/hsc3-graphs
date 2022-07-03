// ln 2021-04-14 https://lukasnowok.github.io/spectrology/
Saw.ar(SinOsc.ar(5.reciprocal, Array.series(10, 0, 2pi/10)).range(100,1500)).sum * 5.reciprocal * 0.1
