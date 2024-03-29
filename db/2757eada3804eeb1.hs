-- nestedAllpassL
let sig = soundIn 0
    nc = 2
    fb = localIn nc ar 0
    lp = lpf sig 4000
    ap1 = allpassL (lp + (0.5 * fb)) 0.008 0.008 0.0459
    ap2 = delayL (allpassL ap1 0.012 0.012 0.06885) 0.004 0.004
    ap3 = delayL (X.nestedAllpassL (delayL ap2 0.017 0.017) 0.025 0.025 0.5 0.062 0.062 0.25) 0.031 0.031
    ap4 = X.doubleNestedAllpassL (delayL ap3 0.003 0.003) 0.120 0.120 0.5 0.076 0.076 0.25 0.030 0.030 0.25
    revout = sum_opt [ap4 * 0.8,ap3 * 0.8,ap2 * 1.5]
    locout = localOut (bpf (revout * 0.4) 1000 0.5)
    rev = mrg2 revout locout
in sig + (rev * 0.5)
