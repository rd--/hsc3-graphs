-- sinOsc ; fm
let f0 = 220
    cR = 1 -- carrier ratio
    mR = 2 -- modulator ratio
    mA = mouseY kr 0.01 4000 Exponential 0.2 -- moduluation amplitude
in sinOsc ar ((f0 * cR) + (sinOsc ar (f0 * mR) 0 * mA)) 0 * 0.1
