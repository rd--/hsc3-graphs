-- dxrand ; c.f. drand ; dxrand never plays the same value twice in a row
let i = mce [0.2,0.4,dseqId 'α' 2 (mce [0.1,0.1])]
    d = dxrandId 'β' dinf i
in tDuty ar d 0 DoNothing (dwhiteId 'γ' dinf 0.5 1) 0
