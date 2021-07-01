-- rTraceRd ; Y is (1/4 1/2 1/4 0 1/4)
let b = asLocalBufId 'α' [0,-1,1/4, 1/4,0,1/2, 1/2,1,1/4, 3/4,0,0, 1,-1,1/4]
    o = sinOsc ar 440 0 * 0.1
    tr n = X.rTraceRd kr b 3 (lfSaw kr 1 0 * 0.5 + 0.5) n
    l = tr 1
    g = tr 2
in pan2 o l g
