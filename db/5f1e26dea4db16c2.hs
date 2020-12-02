-- demand
let t = impulse AR 5 0
    d = drand 'α' dinf (mce [dseq 'β' 1 (mce [1,1,1,1]),dseq 'γ' 1 (mce [1,0,0,0])])
    x = demand t 0 d * t
in decay x 1 * brownNoise 'δ' AR * 0.1
