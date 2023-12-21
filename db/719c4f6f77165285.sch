-- harmonic swimming (jmcc) #1
let a = 0.02
    l = Ln 0 (0 - a) 60
    o h = let e = Max 0 (LfNoise1 (RandN 2 2 8) * a + l)
          in FSinOsc (50 * h) 0 * e
in mixFillOneIndexed 20 o
