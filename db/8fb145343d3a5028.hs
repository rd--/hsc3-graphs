-- MiPlaits ; snare drums
let harm = range 0 0.5 (lfNoise2 'α' KR 0.5)
    timbre = 0.173
    morph = 0.827
    trigger = impulse KR 8 0
    lev = squared (tRand 'β' 0 1 trigger)
in X.miPlaits AR 47 14 harm timbre morph trigger lev 0.2 0.43 0 0.4 0.5 * 0.1
