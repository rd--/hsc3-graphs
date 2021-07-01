-- demand
let t = impulse ar 5 0
    d = drandId 'α' dinf (mce [dseqId 'β' 1 (mce [1,1,1,1]),dseqId 'γ' 1 (mce [1,0,0,0])])
    x = demand t 0 d * t
in decay x 1 * brownNoiseId 'δ' ar * 0.1
