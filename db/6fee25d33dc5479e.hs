-- MiBraids ; 34:KICK
let tr = impulse kr 4 0
    pit = roundE (range 30 50 (latch (pinkNoiseId 'α' kr) tr))
    timb = lfNoise1Id 'β' kr 0.4 * 0.5 + 0.5
    color = lfNoise1Id 'γ' kr 0.3 * 0.5 + 0.5
in X.miBraids ar pit timb color (X.miBraids_mode "KICK") tr 0 0 0 0 * 0.2
