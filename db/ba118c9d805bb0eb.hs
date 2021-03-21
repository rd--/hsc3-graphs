-- sinOsc ; fm
let f0 = 220
    cR = 1 -- carrier ratio
    mR = 2 -- modulator ratio
    mI = mouseY KR 0.01 10 Exponential 0.2 -- moduluation index
in sinOsc AR ((f0 * cR) + (sinOsc AR (f0 * mR) 0 * mI * (f0 * mR))) 0 * 0.1
