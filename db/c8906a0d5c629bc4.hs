-- stkMoog ; mouse trigger
let tr = mouseButton KR 0 1 0 - 0.5
    freq = midiCPS (tiRand 'α' 12 96 tr)
    filterQ = tRand 'β' 0 127 tr
    sweeprate = tRand 'γ' 0 127 tr
    vibfreq = tRand 'δ' 0 127 tr
    vibgain = tRand 'ε' 0 127 tr
    gain = tRand 'ζ' 0 127 tr
in X.stkMoog AR freq filterQ sweeprate vibfreq vibgain gain tr * 0.5
