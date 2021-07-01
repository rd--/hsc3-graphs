-- miElements ; mallets ; particles (mallet type=1 --> use internal model of bouncing particles)
let strike_timbre = lfNoise1Id 'α' kr 0.3 * 0.5 + 0.5
    g = range 0.4 0.7 (lfNoise2Id 'β' kr 0.1)
    maltype = 1
in X.miElements ar 0 0 {-gate-} 1 {-pit-} 40 0.5 {-contour-} 0.5 0 0 {-strike_level-} 0.5 0.5 {-mallet-} maltype 0.5 0.5 strike_timbre {-geom-} g 0.5 0.7 0.2 0.3 0 0
