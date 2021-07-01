-- MiBraids ; 40:WAVE_PARAPHONIC
let timb = lfNoise1Id 'α' kr 0.03 * 0.5 + 0.5
    color = lfNoise1Id 'β' kr 0.05 * 0.5 + 0.5 -- chord
in X.miBraids ar 38 timb color (X.miBraids_mode "WAVE_PARAPHONIC") 0 1 0 0 0 * 0.1
