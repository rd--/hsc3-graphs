-- rFreezer ; k-rate instance
let b = control KR "buf" 0
    n z f i j = linLin (lfNoise2 z KR f) (-1) 1 i j
    left = n 'α' 1 0.3 0.8
    right = left + n 'β' 1 0.01 0.05
in X.rFreezer b left right 0.1 0.5 0.1 0.5 0.05 0 0 24
