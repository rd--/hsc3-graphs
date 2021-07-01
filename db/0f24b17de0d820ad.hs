-- phasor ; as sinOsc, but with precision issues
let f0 = 220
    ph = phasor ar (impulse ar f0 0) (two_pi * f0 / sampleRate) 0 two_pi 0
in sin ph * 0.1
