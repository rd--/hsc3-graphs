-- stkMoog ; mouse control
let x = mouseX KR 0.25 16 Linear 0.2
    tr = impulse KR x 0 - 0.5
    freq = midiCPS (tiRand 'α' 24 72 tr)
    filterQ = tRand 'β' 0 32 tr
    sweeprate = tRand 'γ' 0 32 tr
    vibfreq = tRand 'δ' 0 96 tr
    vibgain = tRand 'ε' 0 16 tr
    gain = tRand 'ζ' 0 127 tr
in X.stkMoog AR freq filterQ sweeprate vibfreq vibgain gain tr * 0.5
