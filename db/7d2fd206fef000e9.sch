-- sprinkler (jmcc) #1
let f = LfPulse 0.09 0 0.16 * 10 + 7
    t = LfPulse f 0 0.25 * 0.1
in Bpz2 (WhiteNoise () * t)
