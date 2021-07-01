-- analogSnareDrum
let trig = dust2Id 'α' kr 8
    infsustain = 0.0
    accent = 0.25
    freq = tExpRandId 'β' 40 220  trig
    tone = tRandId 'γ' 0.0 0.4 trig
    decay = tRandId 'δ' 0.1 0.8 trig
    snappy = tRandId 'ε' 0.0 0.9  trig
    sig = X.analogSnareDrum ar trig infsustain accent freq tone decay snappy
in pan2 sig (tRandId 'ζ' (-1) 1 trig) 0.1
