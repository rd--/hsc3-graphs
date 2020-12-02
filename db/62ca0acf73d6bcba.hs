-- stkShakers ; noise param
let walk z = linLin (lfNoise2 z KR 0.75) (-1) 1
    instr = walk 'α' 0 23
    energy = walk 'β' 0 127
    decay_ = walk 'γ' 0 127
    objects = walk 'δ' 0 127
    resfreq = walk 'ε' 0 127
in pan2 (X.stkShakers AR instr energy decay_ objects resfreq) (lfNoise2 'ζ' KR 0.75) 1
