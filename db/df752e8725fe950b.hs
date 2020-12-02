-- demand
let t = impulse AR 5 0
    d1 = dseq 'α' dinf (mce [1,0,1,1,0,1,0,0,1,0,1])
    d2 = dseq 'β' dinf (mce [0,1,0,0,1,0,1,1,0,1,0])
    x = demand t 0 (mce2 d1 d2) * t
in decay x 1 * brownNoise 'γ' AR * 0.1
