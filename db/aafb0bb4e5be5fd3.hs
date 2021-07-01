-- miElements ; mallets, strength
let gat = coinGateId 'α' 0.4 (impulse kr 6 0)
    stren = tRandId 'β' 0 1 gat
    strike_timbre = lfNoise1Id 'γ' kr 0.3 * 0.5 + 0.5
in X.miElements ar 0 0 gat {-pit-} 40 stren 0.2 0 0 {-strike_level-} 0.5 0.5 {-mallet-} 0.7 0.5 0.5 strike_timbre 0.25 {-bright-} 0.3 {-damp-} 0.85 0.2 {-space-} 0.6 0 0 * 0.5
