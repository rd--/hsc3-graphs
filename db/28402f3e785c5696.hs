-- stkBandedWG ; texture=overlap,4,3,4,inf
let freq = rand 'α' 110 440
    instr = iRand 'β' 1 3
    bowpressure = iRand 'γ' 32 96
    bowmotion = rand 'δ' 32 96
    integration = rand 'ε' 0 64
    modalresonance = rand 'ζ' 32 96
    bowvelocity = rand 'η' 64 96
    setstriking = 127 -- setstriking: 0 = Plucked, 127 = Bowed
in X.stkBandedWG AR freq instr bowpressure bowmotion integration modalresonance bowvelocity setstriking 1
