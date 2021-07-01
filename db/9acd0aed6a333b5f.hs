-- analogBassDrum
let trig = dust2Id 'α' kr 8
    infsustain = 0.0
    accent = 0.25
    freq = tExpRandId 'β' 40 120 trig
    tone = tRandId 'γ' 0.0 0.35 trig
    decay = 0.15
    attackfm = tRandId 'δ' 0.1 0.2 trig
    selffm = tRandId 'ε' 0.1 0.9 trig
    sig = X.analogBassDrum ar trig infsustain accent freq tone decay attackfm selffm
in pan2 sig (tRandId 'ζ' (-1) 1 trig) 1
