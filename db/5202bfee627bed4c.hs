-- blOsc
let freq = randId 'α' 55 220
    width = randId 'β' 0 1
    waveform = iRandId 'γ' 0 2
in pan2 (X.blOsc ar freq width waveform) (randId 'δ' (-1) 1) (randId 'ε' 0.02 0.1)
