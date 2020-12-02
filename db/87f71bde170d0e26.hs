-- MiBraids ; 34:KICK
let tr = impulse KR 4 0
    pit = roundE (range 30 50 (latch (pinkNoise 'α' KR) tr))
    timb = lfNoise1 'β' KR 0.4 * 0.5 + 0.5
    color = lfNoise1 'γ' KR 0.3 * 0.5 + 0.5
in X.miBraids AR pit timb color (X.miBraids_mode "KICK") tr 0 0 0 0 * 0.2
