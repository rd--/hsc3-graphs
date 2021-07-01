-- subsampleOffset; impulse train that can be moved between samples
let i = impulse ar 2000 0
    z = 4
    o = (1 - subsampleOffset) + mouseX kr 0 (z - 1) Linear 0.1
    r = delayC i (sampleDur * z) (sampleDur * o)
in mrg2 (out 0 (pan2 i (-1) 0.1)) (offsetOut 0 (pan2 r 1 0.1))
