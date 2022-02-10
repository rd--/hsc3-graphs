// Rand ; dup
SinOsc.ar({ Rand.ir(220, 226)}.dup(2), 0) * ({ Rand.ir(0.05, 0.10) }.dup(2))
