-- rDelayMap ; simple feedback circuit (static)
let n = whiteNoiseId 'α' ar
    b = clearBuf (localBufId 'β' 1 88200)
    s = decay (impulse ar (5/4) 0) 0.1 * n * 0.2
    a = mce [-1,0,0,1,1/9,0,1,8/9,1,-1,0,1]
in X.rDelayMap b s 0 a
