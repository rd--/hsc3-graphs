-- pond life (jmcc) #1 ; texture=overlap,8,8,4,inf
let f0 = 20 + rand 0 30
    f1 = fsinosc f0 0 * rand 100 400 + linrand 500 2500 0
    a = lfpulse (3 / rand 1 9) 0 (rand 0.2 0.5) * 0.04
in pan2 (sinosc f1 0 * a) (rand2 1) 0.5
