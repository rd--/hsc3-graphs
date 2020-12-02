-- stkShakers ; random param
let x = mouseX KR 0.25 4 Linear 0.2
    tr = impulse KR x 0 - 0.5
    instr = tRand 'α' 0 23 tr
    energy = tRand 'β' 0 127 tr
    decay_ = tRand 'γ' 0 127 tr
    objects = tRand 'δ' 0 127 tr
    resfreq = tRand 'ε' 0 127 tr
in X.stkShakers AR instr energy decay_ objects resfreq
