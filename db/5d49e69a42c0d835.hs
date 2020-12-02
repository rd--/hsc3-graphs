-- lfGauss ; dur and width can be modulated at audio rate
let x = mouseX KR 2 1000 Exponential 0.2
    d = range 0.0006 0.01 (sinOsc AR x 0 * mce2 1 1.1)
    w = range 0.01 0.3 (sinOsc AR (0.5 * (mce2 1 1.1)) 0)
in lfGauss AR d w 0 Loop DoNothing * 0.2
