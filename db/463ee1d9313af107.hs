-- lfGauss ; amplitude modulator
let d = mouseX KR 1 0.001 Exponential 0.2
    g = lfGauss AR d 0.1 0 Loop DoNothing
    o = sinOsc AR 1000 0
in g * o * 0.1
