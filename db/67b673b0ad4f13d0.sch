-- sprinkler (jmcc) #1
let f = lfpulse 0.09 0 0.16 * 10 + 7
    t = lfpulse f 0 0.25 * 0.1
in bpz2 (whitenoise () * t)
