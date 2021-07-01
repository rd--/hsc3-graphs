-- lfGauss ; dur and width can be modulated at audio rate
let x = mouseX kr 2 1000 Exponential 0.2
    d = range 0.0006 0.01 (sinOsc ar x 0 * mce2 1 1.1)
    w = range 0.01 0.3 (sinOsc ar (0.5 * (mce2 1 1.1)) 0)
in lfGauss ar d w 0 Loop DoNothing * 0.2
