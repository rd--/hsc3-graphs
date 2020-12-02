-- MiOmi ; filter and cutoff modulation
let filtmod = range 0 1 (lfTri KR 0.23 0)
    gat = lfPulse KR 6 0 0.2
    cf = range 0 0.5 (lfTri KR 0.2 0)
in X.miOmi AR 0 gat 48 {-contour-} 0.1 0.25 0.5 0.5 0.5 0.5 {-fm1-} 0.5 {-fm2-} 0.5 {-fb-} 0.5 0 filtmod cf 0 {-strength-} 0 0.5 0.2 0.5
