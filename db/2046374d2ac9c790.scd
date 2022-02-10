// ExpRand dup
SinOsc.ar({ ExpRand.ir(110, 220) }.dup(2), 0) * ({ ExpRand.ir(0.05, 0.10) }.dup(2))
