-- rDelayMap
let a = mce [-1,0,0,0.5,1,-1,0,1]
    b = clearBuf (localBuf 'α' 1 88200)
    x = mouseX KR 110 440 Linear 0.1
    y = mouseY KR 0.0 0.2 Linear 0.1
    o = sinOsc AR x 0 * y
in mce [X.rDelayMap b o 0 a,o]
