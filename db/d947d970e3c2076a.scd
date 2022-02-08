// ExpRand dup
SinOsc.ar({ExpRand(110, 220)}.dup(2), 0) * ({ExpRand(0.05, 0.10)}.dup(2))
