-- harmonic swimming (jmcc) #1
let a = 0.02
    f = 50
    p = 20
    l = line kr 0 (- a) 60 DoNothing
    o h = let r = X.randN 2 2 8
              n = lfNoise1 kr r
              e = max 0 (n * a + l)
          in fSinOsc ar (f * (h + 1)) 0 * e
in mixFill p o
