-- rDelayMap ; simple feedback circuit (dynamic)
let n = whiteNoise 'α' AR -- soundIn 0
    s = decay (impulse AR (mce [1/3,5/4]) 0) 0.1 * n * 0.2
    x = mouseX KR 0.05 1.05 Linear 0.1
    y = mouseY KR 0.05 0.95 Linear 0.1
    a = mce [-1,0,0,1,y,0,1,x,1,-1,0,1]
    b = clearBuf (localBuf 'β' 1 88200)
in X.rDelayMap b s 1 a
