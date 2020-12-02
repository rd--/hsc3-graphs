-- rFreezer ; k-rate instance
let b = control KR "buf" 0
    n z i j = linLin (lfNoise2 z KR 0.1) (-1) 1 i j
in X.rFreezer b (n 'α' 0.3 0.4) (n 'β' 0.5 0.6) (n 'γ' 0.3 0.6) (n 'δ' 0.95 1.05) (n 'ε' 0.05 0.15) (n 'ζ' 0.05 0.15) (n 'η' 0.05 0.15) 0 0 36
