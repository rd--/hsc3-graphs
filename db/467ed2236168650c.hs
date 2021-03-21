-- sinOsc ; fm
let f0 = 220
    cR = 1 -- carrier ratio
    mR = 2 -- modulator ratio
    mA = mouseY KR 0.01 4000 Exponential 0.2 -- moduluation amplitude
in sinOsc AR ((f0 * cR) + (sinOsc AR (f0 * mR) 0 * mA)) 0 * 0.1
