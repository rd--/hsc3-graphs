-- MiBraids ; 1:MORPH ; some modulation
let timb = lfNoise1 'α' KR 0.5 * 0.5 + 0.5
in X.miBraids AR 40 timb 0 (X.miBraids_mode "MORPH") 0 0 0 0 0 * 0.05
