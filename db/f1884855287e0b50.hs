-- stkShakers ; random param
let x = mouseX kr 0.25 4 Linear 0.2
    tr = impulse kr x 0 - 0.5
    instr = tRandId 'α' 0 23 tr
    energy = tRandId 'β' 0 127 tr
    decay_ = tRandId 'γ' 0 127 tr
    objects = tRandId 'δ' 0 127 tr
    resfreq = tRandId 'ε' 0 127 tr
in X.stkShakers ar instr energy decay_ objects resfreq
