// ln 2021-04-11 https://lukasnowok.github.io/spectrology/
(BPF.ar(WhiteNoise.ar, 10000, XLine.ar(2, 0.002, 20)) + (SinOsc.ar(10000) * XLine.ar(0.001, 0.3, 20))) * 0.1
