-- drand
let d = drand 'α' dinf
        (mce [dseq 'β' 1 (mce [2, 0, 2, 0, 1, 0, 1, 1])
             ,dseq 'γ' 1 (mce [2, 0, 1, 0, 1, 0, 1, 0])
             ,dseq 'δ' 1 (mce [2, 0, 1, 1, 1, 1, 1, 0])
             ,dseq 'ε' 1 (mce [2, 0.3, 0.3, 1, 0.3, 0.3, 1, 0.3])
             ,dseq 'ζ' 1 (mce [2, 0, 0.3, 0, 0.3, 0, 0.3, 0])
             ,dseq 'η' 1 (mce [2, 0, 0, 1, 0, 0, 0, 0])
             ,dseq 'θ' 1 (mce [2, 0, 0, 0, 0, 0, 0, 0])
             ,dseq 'ι' 1 (mce [0, 1, 0, 1, 0, 1, 0, 1])
             ,dseq 'κ' 1 (mce [1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0])])
    t = impulse AR 10 0
    x = demand t 0 d * t
in decay x 1 * pinkNoise 'λ' AR * 0.1