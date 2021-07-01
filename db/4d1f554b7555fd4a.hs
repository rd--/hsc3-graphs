-- MiBraids ; 1:MORPH ; some modulation
let timb = lfNoise1Id 'α' kr 0.5 * 0.5 + 0.5
in X.miBraids ar 40 timb 0 (X.miBraids_mode "MORPH") 0 0 0 0 0 * 0.05
