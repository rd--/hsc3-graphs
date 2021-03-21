-- blOsc
let freq = rand 'α' 55 220
    width = rand 'β' 0 1
    waveform = iRand 'γ' 0 2
in pan2 (X.blOsc AR freq width waveform) (rand 'δ' (-1) 1) (rand 'ε' 0.02 0.1)
