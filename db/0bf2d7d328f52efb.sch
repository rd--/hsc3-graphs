-- pond life (jmcc) #1 ; texture=overlap, 8, 8, 4, inf
let f0 = 20 + Rand 0 30
    f1 = FSinOsc f0 0 * Rand 100 400 + LinRand 500 2500 0
    a = LFPulse (3 / Rand 1 9) 0 (Rand 0.2 0.5) * 0.04
in Pan2 (SinOsc f1 0 * a) (Rand2 1) 0.5
