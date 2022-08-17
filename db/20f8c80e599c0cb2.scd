// mouse x controls phase relation ;  / shape = in-phase ; \ shape = out-of-phase ;  O shape = 90 degree phase relation ; jmcc
SinOsc.ar(80, [0, MouseX.kr(0, 2 * pi, 0, 0.2)]) / 3
