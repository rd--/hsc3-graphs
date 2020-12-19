-- diodeRingMod
let s1 = sinOsc AR (3700 * mce [1, 1.1, 1.2] * range 1 2 (sinOsc AR 200 0)) 0
    s2 = sinOsc AR (100 * mce [0.75, 1, 0.5]) 0
    s3 = X.diodeRingMod s1 s2
in mix s3 * lfPulse AR (10.3 * 0.5) 0 0.04 * 0.1
