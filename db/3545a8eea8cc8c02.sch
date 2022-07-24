-- harmonic swimming (jmcc) #1
let a = 0.02
    l = Line 0 (- a) 60 0
    o h = let r = mceFill 2 (\_ -> Rand 2 8)
              e = Max 0 (LFNoise1 [Rand 2 8, Rand 2 8] * a + l)
          in FSinOsc (50 * h) 0 * e
in mixFillOneIndexed 20 o
