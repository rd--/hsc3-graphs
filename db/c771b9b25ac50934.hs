-- hell is busy (jmcc) #1 ; texture=overlap,4,4,8,inf ; id
let o = fSinOsc ar (400 + randId 'α' 0 2000) 0
    a = lfPulse kr (1 + randId 'β' 0 10.0) 0 (randId 'γ' 0 0.7) * 0.04
in pan2 (o * a) (randId 'δ' (-1) 1) 1
