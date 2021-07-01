-- MiBraids ; 21:VOSIM
let pit = roundE (range 33 66 (lfNoise0Id 'α' kr 4))
    timb = lfNoise1Id 'α' kr 0.3 * 0.5 + 0.5
    color = lfNoise1Id 'α' kr 0.3 * 0.5 + 0.5
in X.miBraids ar pit timb color (X.miBraids_mode "VOSIM") 0 0 0 0 0 * 0.1
