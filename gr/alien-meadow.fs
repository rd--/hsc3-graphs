\ alien meadow (jmcc) #6

: alien-meadow
  0 20 Rand.ir { a }
  0 5000 Rand.ir { b }
  0 20 Rand.ir { c }
  -1 1 Rand.ir { p }
  a 0 SinOsc.ar b * 0.1 * b + { f }
  f 0 SinOsc.ar p c 0 SinOsc.ar 0.05 * 0.05 + Pan2.ar ;

: alien-meadows alien-meadow 2 6 6 32 overlap-texture ;

alien-meadows

(
20 RAND_ 0 SINOSC.AR 5000 RAND_ * 0.1 * 5000 RAND_ + 0 SINOSC.AR
-1 1 RAND.IR 20 RAND_ 0 SINOSC.AR 0.05 * 0.05 + PAN2 DRAW
)
