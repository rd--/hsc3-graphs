-- miElements ; mallets  strength
let gat = coinGate 'α' 0.4 (impulse KR 6 0)
    stren = tRand 'β' 0 1 gat
    strike_timbre = lfNoise1 'γ' KR 0.3 * 0.5 + 0.5
in X.miElements AR 0 0 gat {-pit-} 40 stren 0.2 0 0 {-strike_level-} 0.5 0.5 {-mallet-} 0.7 0.5 0.5 strike_timbre 0.25 {-bright-} 0.3 {-damp-} 0.85 0.2 {-space-} 0.6 0 0 * 0.5
