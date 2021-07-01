-- stkShakers ; noise param
let walkId z = linLin (lfNoise2Id z kr 0.75) (-1) 1
    instr = walkId 'α' 0 23
    energy = walkId 'β' 0 127
    decay_ = walkId 'γ' 0 127
    objects = walkId 'δ' 0 127
    resfreq = walkId 'ε' 0 127
in pan2 (X.stkShakers ar instr energy decay_ objects resfreq) (lfNoise2Id 'ζ' kr 0.75) 1
