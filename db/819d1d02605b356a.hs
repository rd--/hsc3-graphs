-- rTraceRd ; printing only
let b = asLocalBuf 'α' [0,-1,1/4, 1/4,0,1/2, 1/2,1,1/4, 3/4,0,0, 1,-1,1/4]
    ph = mouseX KR 0 1 Linear 0.05
    tr = X.rTraceRd KR b 3 ph 1
    labels = mce . map label
    pr = poll (impulse KR 5 0) (mce2 ph tr) 0 (labels ["ph","tr"])
in mrg2 (out 0 (dc AR 0)) pr
