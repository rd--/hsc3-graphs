-- pond life (jmcc) #1 ; texture=overlap,8,8,4,inf
let f0 = 20 + rand 0 30
    f1 = fSinOsc kr f0 0 * rand 100 400 + linRand 500 2500 0
    a = lfPulse kr (3 / rand 1 9) 0 (rand 0.2 0.5) * 0.04
in pan2 (sinOsc ar f1 0 * a) (rand (-1) 1) 0.5
