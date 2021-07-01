-- MiPlaits ; snare drums
let harm = range 0 0.5 (lfNoise2Id 'α' kr 0.5)
    timbre = 0.173
    morph = 0.827
    trigger = impulse kr 8 0
    lev = squared (tRandId 'β' 0 1 trigger)
in X.miPlaits ar 47 14 harm timbre morph trigger lev 0.2 0.43 0 0.4 0.5 * 0.1
