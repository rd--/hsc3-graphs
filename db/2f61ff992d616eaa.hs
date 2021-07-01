-- sos ; http://www.earlevel.com/main/2011/01/02/biquad-formulas/
let fc = 100
    sr = 48000
    k = tan (pi * fc / sr)
    q = 0.707
    norm = 1 / (1 + k / q + k * k)
    a0 = k * k * norm
    a1 = 2 * a0
    a2 = a0
    b1 = 2 * (k * k - 1) * norm
    b2 = (1 - k / q + k * k) * norm
in sos (whiteNoiseId 'α' ar * 0.2) a0 a1 a2 (- b1) (- b2)
