-- stkMandolin
let x = mouseX KR 3 16 Linear 0.2
    tr = impulse KR x 0 - 0.5 -- trig
    tr3 = pulseDivider tr 3 0
    freq = midiCPS (tiRand 'α' 54 66 tr)
    bodysize = tRand 'β' 72 94 tr3
    pickposition = tRand 'γ' 32 42 tr3
    stringdamping = tRand 'δ' 64 72 tr3
    stringdetune = tRand 'ε' 0 4 tr3
    aftertouch = tRand 'ζ' 2 8 tr3
    m = X.stkMandolin AR freq bodysize pickposition stringdamping stringdetune aftertouch tr
in pan2 m (tRand 'η' (-1) 1 tr) 0.5
