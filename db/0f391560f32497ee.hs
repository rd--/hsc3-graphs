-- blOsc ; k-rate (not implemented for width/waveform)
let tr = dustId 'α' kr 2
    freq = tRandId 'β' 55 220 tr
    width = tRandId 'γ' 0 1 tr
    waveform = tiRandId 'δ' 0 2 tr
in pan2 (X.blOsc ar freq width waveform) (tRandId 'ε' (-1) 1 tr) (tRandId 'ζ' 0.02 0.1 tr)
