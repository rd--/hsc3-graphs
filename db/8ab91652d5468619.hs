-- rTraceRd
let b = asLocalBufId 'α' [0,-1,1/4, 1/4,0,1/2, 1/2,1,1/4, 3/4,0,0, 1,-1,1/4]
    x = X.rTraceRd kr b 3 (lfSaw kr 1 0 * 0.5 + 0.5) 1
    o = sinOsc ar (linLin x (-1) 1 440 880) 0 * 0.1
in pan2 o 0 1
