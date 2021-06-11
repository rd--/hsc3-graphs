-- sprinkler mouse (jmcc) #1
let f = mousex 0.2 50 linear 0.2
    t = lfpulse f 0 0.25 * 0.1
in bpz2 (whitenoise () * t)
