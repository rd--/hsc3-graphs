-- demand
let t = impulse ar 5 0
    d1 = dseqId 'α' dinf (mce [1,0,1,1,0,1,0,0,1,0,1])
    d2 = dseqId 'β' dinf (mce [0,1,0,0,1,0,1,1,0,1,0])
    x = demand t 0 (mce2 d1 d2) * t
in decay x 1 * brownNoiseId 'γ' ar * 0.1
