-- police state (jmcc) #2
let nd _ = let f = sinOsc kr (rand 0.02 0.12) (rand 0 (pi * 2)) * rand 0 600 + rand 700 1300
           in pan2 (sinOsc ar f 0 * lfNoise2 ar (rand 80 120) * 0.1) (rand2 1) 1
    e = lfNoise2 ar (mceFill 2 (\_ -> lfNoise2 kr 0.4) * 90 + 620) * lfNoise2 kr (mce2 0.3 0.301) * 0.15 + 0.18
in combL (mixFill 4 nd + e) 0.3 0.3 3
