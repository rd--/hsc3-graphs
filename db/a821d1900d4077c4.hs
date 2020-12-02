-- rTraceRd
let b = asLocalBuf 'α' [0,-1,1/4, 1/4,0,1/2, 1/2,1,1/4, 3/4,0,0, 1,-1,1/4]
    x = X.rTraceRd KR b 3 (lfSaw KR 1 0 * 0.5 + 0.5) 1
    o = sinOsc AR (linLin x (-1) 1 440 880) 0 * 0.1
in pan2 o 0 1
