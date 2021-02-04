-- rdx7 ; data at shared buffer
let nv = 32 -- 221
    buf = control KR "dat" 100
    tr = dust 'α' KR 2.0
    gate_ = toggleFF tr
    reset_ = 0
    data_ = 0
    vc = tRand 'β' 0 (nv - 1) tr
    mnn = tRand 'γ' 56.5 57.5 tr -- FRACTIONAL MIDI NOTE NUMBER -- 60 61
    vel = tRand 'δ' 10 29 tr
    loc = tRand 'ε' (-1) 1 tr
in pan2 (X.rdx7 AR buf gate_ reset_ data_ vc mnn vel 0x2000 0 0 0) loc 1
