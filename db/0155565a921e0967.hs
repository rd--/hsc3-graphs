-- pond life (jmcc) #1 ; texture=overlap,8,8,4,inf ; id
let f0 = 20 + randId 'α' 0 30
    f1 = fSinOsc kr f0 0 * randId 'β' 100 400 + linRandId 'γ' 500 2500 0
    a = lfPulse kr (3 / randId 'δ' 1 9) 0 (randId 'ε' 0.2 0.5) * 0.04
in pan2 (sinOsc ar f1 0 * a) (randId 'ζ' (-1) 1) 0.5
