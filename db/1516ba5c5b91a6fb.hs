-- lfGauss ; amplitude modulator
let d = mouseX kr 1 0.001 Exponential 0.2
    g = lfGauss ar d 0.1 0 Loop DoNothing
    o = sinOsc ar 1000 0
in g * o * 0.1
