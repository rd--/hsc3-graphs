-- stkMoog ; mouse trigger
let tr = mouseButton kr 0 1 0 - 0.5
    freq = midiCPS (tiRandId 'α' 12 96 tr)
    filterQ = tRandId 'β' 0 127 tr
    sweeprate = tRandId 'γ' 0 127 tr
    vibfreq = tRandId 'δ' 0 127 tr
    vibgain = tRandId 'ε' 0 127 tr
    gain = tRandId 'ζ' 0 127 tr
in X.stkMoog ar freq filterQ sweeprate vibfreq vibgain gain tr * 0.5
