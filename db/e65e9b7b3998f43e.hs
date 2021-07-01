-- stringVoice
let pan = 0
    freq = 100
    trig = dust2Id 'α' kr 7
    infsustain = 0
    accent = tRandId 'β' 0 1 trig
    structure = tRandId 'γ' 0 1 trig
    brightness = tRandId 'δ' 0 0.5 trig
    damping = tRandId 'ε' 0.1 0.5 trig
    sig = X.stringVoice ar trig infsustain freq accent structure brightness damping
in pan2 sig pan 1
