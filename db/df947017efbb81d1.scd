// Squine ; hardsync rising over 20 secs
Squine.ar(100, SinOsc.kr(0.3, 0) * 0.2 + 0.5, 1, Impulse.ar(XLn.kr(5, 500, 20))) * 0.1
