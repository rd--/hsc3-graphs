-- MiBraids ; 21:VOSIM
let pit = roundE (range 33 66 (lfNoise0 'α' KR 4))
    timb = lfNoise1 'α' KR 0.3 * 0.5 + 0.5
    color = lfNoise1 'α' KR 0.3 * 0.5 + 0.5
in X.miBraids AR pit timb color (X.miBraids_mode "VOSIM") 0 0 0 0 0 * 0.1
