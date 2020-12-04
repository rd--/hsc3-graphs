-- dxrand ; c.f. drand ; dxrand never plays the same value twice in a row
let i = mce [0.2,0.4,dseq 'α' 2 (mce [0.1,0.1])]
    d = dxrand 'β' dinf i
in tDuty AR d 0 DoNothing (dwhite 'γ' dinf 0.5 1) 0
