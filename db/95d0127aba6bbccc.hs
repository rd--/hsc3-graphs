-- rFreezer ; k-rate instance
let b = control kr "buf" 0
    nId z i j = linLin (lfNoise2Id z kr 0.1) (-1) 1 i j
in X.rFreezer b (nId 'α' 0.3 0.4) (nId 'β' 0.5 0.6) (nId 'γ' 0.3 0.6) (nId 'δ' 0.95 1.05) (nId 'ε' 0.05 0.15) (nId 'ζ' 0.05 0.15) (nId 'η' 0.05 0.15) 0 0 36
