-- miElements ; mallets ; particles (mallet type=1 --> use internal model of bouncing particles)
let strike_timbre = lfNoise1 'α' KR 0.3 * 0.5 + 0.5
    g = range 0.4 0.7 (lfNoise2 'β' KR 0.1)
    maltype = 1
in X.miElements AR 0 0 {-gate-} 1 {-pit-} 40 0.5 {-contour-} 0.5 0 0 {-strike_level-} 0.5 0.5 {-mallet-} maltype 0.5 0.5 strike_timbre {-geom-} g 0.5 0.7 0.2 0.3 0 0
