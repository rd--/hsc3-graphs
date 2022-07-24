-- sprinkler mouse (jmcc) #1
let f = MouseX 0.2 50 linear 0.2
    t = LFPulse f 0 0.25 * 0.1
in BPZ2 (WhiteNoise () * t)
