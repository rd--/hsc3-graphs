-- hell is busy (jmcc) #1 ; texture=overlap,4,4,8,inf
let o = fSinOsc ar (400 + rand 0 2000) 0
    a = lfPulse kr (1 + rand 0 10.0) 0 (rand 0 0.7) * 0.04
in pan2 (o * a) (rand (-1) 1) 1
