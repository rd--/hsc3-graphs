-- birds (jmcc)
let node _ = let f = rand 94.0 102.0 + lag (lfSaw ar (7 + rand2 1.5) (rand 0 1) * rand 11 15) 0.1
                 a = lfPulse kr (1.0 / rand 12 15.6) (rand 0 1) 0.16 * 0.05
                 b = sinOsc ar (midiCPS f) (rand 0 1) * a
             in rotate2 b (silent 1) (rand2 1)
    apfr i = allpassL i 0.07 (rand 0 0.06) (rand 0.7 2.0)
    d = mixFill 6 node
    w = iter 12 apfr d
in d * 0.7 + w * 0.3
