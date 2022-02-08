// https://scsynth.org/t/5296 ; tm881
{ Saw.ar({ Rand.ir(33, 2000) }.dup(2) * XLine.kr(Rand.ir(0.125, 8), Rand.ir(0.125, 8), 60)) }.dup(99).sum / 99
