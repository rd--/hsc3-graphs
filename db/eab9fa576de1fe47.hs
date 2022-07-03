-- freezer ; k-rate instance ; id
let b = control kr "buf" 0
    nId z f i j = linLin (lfNoise2Id z kr f) (-1) 1 i j
    left = nId 'α' 1 0.3 0.8
    right = left + nId 'β' 1 0.01 0.05
in X.freezer b left right 0.1 0.5 0.1 0.5 0.05 0 0 24
