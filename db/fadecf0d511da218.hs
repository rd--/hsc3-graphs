-- freezer ; k-rate instance
let b = control kr "buf" 100
    n i j = linLin (lfNoise2 kr 0.1) (-1) 1 i j
in X.freezer b (n 0.3 0.4) (n 0.5 0.6) (n 0.3 0.6) (n 0.95 1.05) (n 0.05 0.15) (n 0.05 0.15) (n 0.05 0.15) 0 0 36
