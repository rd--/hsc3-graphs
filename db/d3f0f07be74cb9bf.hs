-- plucked strings (jmcc)
let dt _ = 1 / midiCPS (floorE (rand 60 90))
    i _ = let s0 = impulse ar (rand 2 2.2) 0 * 0.3
              s1 = dust ar 0.5 * 0.3
              s2 = impulse ar (sinOsc kr (rand 0.05 0.15) (rand 0 (pi * 2)) * 5 + 5.2) 0 * 0.3
          in select (iRand 0 2) (mce [s0,s1,s2])
    s n = let dt' = dt n
              t = decay (i n) 0.1 * pinkNoise ar * 0.1
          in pan2 (combL t dt' dt' 4) (rand2 1) 1
in mixFill 5 s
