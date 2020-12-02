-- nestedAllpassL
let sig = soundIn 0
    nc = 2
    fb = localIn nc AR 0
    lp = lpf sig 6000
    ap1 = X.doubleNestedAllpassL (lp + (0.5 * fb)) 0.0047 0.0047 0.25 0.0083 0.0083 0.35 0.022 0.022 0.45
    ap2 = delayL (X.nestedAllpassL (delayL ap1 0.05 0.05) 0.03 0.03 0.25952 0.03 0.03 0.3) 0.067 0.067
    ap3 = X.nestedAllpassL (lp + (delayL ap2 0.015 0.015 * 0.4)) 0.0292 0.0292 0.25 0.0098 0.0098 0.35
    revout = sum_opt [ap1,ap2,ap3] * 0.5
    locout = localOut (bpf (revout * 0.4) 1000 0.5)
    rev = mrg2 revout locout
in sig + (rev * 0.5)
