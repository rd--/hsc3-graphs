-- freezer ; k-rate instance
let b = control kr "buf" 100
    n f i j = linLin (lfNoise2 kr f) (-1) 1 i j
    left = n 1 0.3 0.8
    right = left + n 1 0.01 0.05
in X.freezer b left right 0.1 0.5 0.1 0.5 0.05 0 0 24
