-- harmonic swimming (jmcc) #1
let a = 0.02
    l = line 0 (- a) 60 0
    o h = let r = mcefill 2 (\_ -> rand 2 8)
              e = max 0 (lfnoise1 [rand 2 8,rand 2 8] * a + l)
          in fsinosc (50 * h) 0 * e
in mixfilloneindexed 20 o
