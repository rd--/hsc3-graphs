-- blOsc ; k-rate (not implemented for width/waveform)
let tr = dust 'α' KR 2
    freq = tRand 'β' 55 220 tr
    width = tRand 'γ' 0 1 tr
    waveform = tiRand 'δ' 0 2 tr
in pan2 (X.blOsc AR freq width waveform) (tRand 'ε' (-1) 1 tr) (tRand 'ζ' 0.02 0.1 tr)
