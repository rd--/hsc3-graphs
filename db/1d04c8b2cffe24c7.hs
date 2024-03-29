-- harmonic swimming (jmcc) #1 ; id
let a = 0.02
    f = 50
    p = 20::Int
    l = line kr 0 (- a) 60 DoNothing
    o h = let r = X.randNId 2 h 2 8
              n = lfNoise1Id h kr r
              e = max 0 (n * a + l)
          in fSinOsc ar (f * (fromIntegral h + 1)) 0 * e
in sum (map o [0 .. p - 1])
