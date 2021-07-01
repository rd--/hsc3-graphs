-- dxrand
let i0 = mce [0.2,0.4,dseqId 'α' 2 (mce [0.1,0.1])]
    i1 = mceMap (* 0.5) i0
    i2 = i0 * 0.5
    d = dxrandId 'β' dinf i2 -- compare i1 & i2
in tDuty ar d 0 DoNothing (dwhiteId 'γ' dinf 0.5 1) 0
