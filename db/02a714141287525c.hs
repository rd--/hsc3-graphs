-- stkBandedWG ; texture=overlap,4,3,4,inf
let freq = randId 'α' 110 440
    instr = iRandId 'β' 1 3
    bowpressure = iRandId 'γ' 32 96
    bowmotion = randId 'δ' 32 96
    integration = randId 'ε' 0 64
    modalresonance = randId 'ζ' 32 96
    bowvelocity = randId 'η' 64 96
    setstriking = 127 -- setstriking: 0 = Plucked, 127 = Bowed
in X.stkBandedWG ar freq instr bowpressure bowmotion integration modalresonance bowvelocity setstriking 1
