-- MiRipples
let cf = range 0 1 (lfNoise0Id 'α' kr 4)
in X.miRipples (saw ar 60) cf 0.6 1 * 0.5
