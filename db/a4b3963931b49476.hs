-- friction ; filters a sine wave ; chaotic result
let o = sinOsc AR 660 0
    s = X.friction AR o 0.0000541322 0.414 0.313 8.05501 1.0
in pan2 s 0 0.1
