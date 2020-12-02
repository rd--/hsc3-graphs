-- MiBraids ; trigger (28:PLUCKED)
let tr = dust 'α' KR 0.6
    pit = roundE (tRand 'β' 45 72 tr)
    timb = 0.5
    color = lfNoise1 'γ' KR 0.3 * 0.5 + 0.5
in X.miBraids AR pit timb color (X.miBraids_mode "PLUCKED") tr 0 0 0 0 * 0.1
