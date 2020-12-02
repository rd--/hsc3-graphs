-- rTraceRd ; listening ; X is (-1 0 1 0 -1)
let b = asLocalBuf 'α' [0,-1,1/4, 1/4,0,1/2, 1/2,1,1/4, 3/4,0,0, 1,-1,1/4]
    o = sinOsc AR 440 0 * 0.1
    x = X.rTraceRd KR b 3 (lfSaw KR 1 0 * 0.5 + 0.5) 1
in pan2 o x 1
