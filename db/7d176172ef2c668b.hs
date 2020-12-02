-- MiBraids ; 40:WAVE_PARAPHONIC
let timb = lfNoise1 'α' KR 0.03 * 0.5 + 0.5
    color = lfNoise1 'β' KR 0.05 * 0.5 + 0.5 -- chord
in X.miBraids AR 38 timb color (X.miBraids_mode "WAVE_PARAPHONIC") 0 1 0 0 0 * 0.1
