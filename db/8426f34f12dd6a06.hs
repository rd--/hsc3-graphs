-- drand
let d = drandId 'α' dinf
        (mce [dseqId 'β' 1 (mce [2, 0, 2, 0, 1, 0, 1, 1])
             ,dseqId 'γ' 1 (mce [2, 0, 1, 0, 1, 0, 1, 0])
             ,dseqId 'δ' 1 (mce [2, 0, 1, 1, 1, 1, 1, 0])
             ,dseqId 'ε' 1 (mce [2, 0.3, 0.3, 1, 0.3, 0.3, 1, 0.3])
             ,dseqId 'ζ' 1 (mce [2, 0, 0.3, 0, 0.3, 0, 0.3, 0])
             ,dseqId 'η' 1 (mce [2, 0, 0, 1, 0, 0, 0, 0])
             ,dseqId 'θ' 1 (mce [2, 0, 0, 0, 0, 0, 0, 0])
             ,dseqId 'ι' 1 (mce [0, 1, 0, 1, 0, 1, 0, 1])
             ,dseqId 'κ' 1 (mce [1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0])])
    t = impulse ar 10 0
    x = demand t 0 d * t
in decay x 1 * pinkNoiseId 'λ' ar * 0.1
