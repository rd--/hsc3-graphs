-- MiBraids ; trigger (28:PLUCKED)
let tr = dustId 'α' kr 0.6
    pit = roundE (tRandId 'β' 45 72 tr)
    timb = 0.5
    color = lfNoise1Id 'γ' kr 0.3 * 0.5 + 0.5
in X.miBraids ar pit timb color (X.miBraids_mode "PLUCKED") tr 0 0 0 0 * 0.1
