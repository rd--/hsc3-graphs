-- stkMoog ; mouse control
let x = mouseX kr 0.25 16 Linear 0.2
    tr = impulse kr x 0 - 0.5
    freq = midiCps (tiRandId 'α' 24 72 tr)
    filterQ = tRandId 'β' 0 32 tr
    sweeprate = tRandId 'γ' 0 32 tr
    vibfreq = tRandId 'δ' 0 96 tr
    vibgain = tRandId 'ε' 0 16 tr
    gain = tRandId 'ζ' 0 127 tr
in X.stkMoog ar freq filterQ sweeprate vibfreq vibgain gain tr * 0.5
