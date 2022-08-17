-- envAdsr ; record variant
let g = control kr "gate" 1
    c = EnvNum (-4)
    r = Adsr {adsr_attackTime = 0.75
             ,adsr_decayTime = 0.75
             ,adsr_sustainLevel = 0.5
             ,adsr_releaseTime = 0.75
             ,adsr_peakLevel = 1
             ,adsr_curve = (c,c,c)
             ,adsr_bias = 0}
    p = envAdsr_r r
    e = envGen kr g 0.1 0 1 DoNothing p
in sinOsc ar 440 0 * e
