// UGen.linlin ; note Clip UGen
SinOsc.ar(Sweep.kr(0, 1).linlin(0, 1, 110, 220, 'minmax'), 0)
