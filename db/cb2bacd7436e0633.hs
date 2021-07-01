-- rTraceRd ; printing only
let b = asLocalBufId 'α' [0,-1,1/4, 1/4,0,1/2, 1/2,1,1/4, 3/4,0,0, 1,-1,1/4]
    ph = mouseX kr 0 1 Linear 0.05
    tr = X.rTraceRd kr b 3 ph 1
    labels = mce . map label
    pr = poll (impulse kr 5 0) (mce2 ph tr) 0 (labels ["ph","tr"])
in mrg2 (out 0 (dc ar 0)) pr
