-- MiPlaits ; filtered noise
let harm = 0.575
    timbre = 0.02
    morph = range_hs (0.55,0.9) (lfNoise1Id 'α' kr 0.3) -- filter resonance
in X.miPlaits ar 62 9 harm timbre morph 0 0 0 0 0 0.5 0.5 * 0.25
