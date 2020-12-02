-- MiRipples
let cf = range 0 1 (lfNoise0 'α' KR 4)
in X.miRipples (saw AR 60) cf 0.6 1 * 0.5
