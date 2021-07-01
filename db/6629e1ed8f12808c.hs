-- phasor ; frequency: rate = (end - start) * freq / sample-rate ; precision is an issue.
let f = mouseX kr 220 880 Exponential 0.1
    tr = impulse ar f 0
    sr = sampleRate
    x = phasor ar tr (two_pi * f / sr) 0 two_pi 0
in sin x * 0.1
