-- MiPlaits ; 12=modal
let harm = range 0 1 (lfNoise2 'α' KR 0.2)
    trigger = impulse KR 1 0
    lev = squared (tRand 'β' 0 1 trigger)
in mix (X.miPlaits AR 56 (X.miPlaits_mode "modal") harm 0 0.85 trigger lev 0 0 0 0.5 0.5)
