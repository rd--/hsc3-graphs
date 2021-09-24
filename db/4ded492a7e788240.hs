-- rdx7 ; data at shared buffer
let nv = 32 -- 221
    buf = control kr "dat" 100
    tr = dustId 'α' kr 2.0
    gate_ = toggleFF tr
    reset_ = 0
    data_ = 0
    vc = tRandId 'β' 0 (nv - 1) tr
    mnn = tRandId 'γ' 56.5 57.5 tr -- fractional midi note number -- 60 61
    vel = tRandId 'δ' 10 29 tr
    loc = tRandId 'ε' (-1) 1 tr
in pan2 (X.rdx7 ar buf gate_ reset_ data_ vc mnn vel 0x2000 0 0 0) loc 1
