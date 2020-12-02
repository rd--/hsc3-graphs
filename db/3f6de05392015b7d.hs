-- MiPlaits ; filtered noise
let harm = 0.575
    timbre = 0.02
    morph = range_hs (0.55,0.9) (lfNoise1 'α' KR 0.3) -- filter resonance
in X.miPlaits AR 62 9 harm timbre morph 0 0 0 0 0 0.5 0.5 * 0.25
