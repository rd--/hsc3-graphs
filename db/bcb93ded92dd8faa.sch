-- sprinkler (jmcc) #1
let f = LFPulse 0.09 0 0.16 * 10 + 7
    t = LFPulse f 0 0.25 * 0.1
in BPZ2 (WhiteNoise () * t)
