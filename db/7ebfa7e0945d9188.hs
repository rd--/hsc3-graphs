-- nestedAllpassL
let sig = soundIn 0
    nc = 2
    nestedAllpassL_def s =
      let d1 = 0.036
          d2 = 0.030
      in X.nestedAllpassL s d1 d1 0.08 d2 d2 0.3
    doubleNestedAllpassL_def s =
      let d1 = 0.0047
          d2 = 0.022
          d3 = 0.0084
      in X.doubleNestedAllpassL s d1 d1 0.15 d2 d2 0.25 d3 d3 0.3
    fb = localIn nc ar 0
    lp0 = lpf sig 6000
    lp1 = delayL lp0 0.024 0.024
    ap1 = doubleNestedAllpassL_def (lp1 + (0.5 * fb))
    ap2 = nestedAllpassL_def ap1
    revout = ap1 * 0.5 + ap2 * 0.6
    locout = localOut (bpf (revout * 0.5) 1600 0.5)
    rev = mrg2 revout locout
in sig + (rev * 0.5)
