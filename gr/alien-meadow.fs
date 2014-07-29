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

\ 20 Rand 0 SinOsc.ar 5000 Rand * 0.1 * 5000 Rand + 0 SinOsc.ar
\ -1 1 Rand.ir 20 Rand 0 SinOsc.ar 0.05 * 0.05 + Pan2.ar draw

\ 0 20 0 uid Rand.ir 0 SinOsc.ar 0 5000 1 uid Rand.ir * 0.1 * 0 5000 1 uid Rand.ir + 0 SinOsc.ar
\ -1 1 3 uid Rand.ir 0 20 2 uid Rand.ir 0 SinOsc.ar 0.05 * 0.05 + Pan2.ar
