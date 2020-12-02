-- stkMandolin
let x = mouseX KR 0.25 16 Linear 0.2
    tr = impulse KR x 0 - 0.5
    freq = midiCPS (tiRand 'α' 32 96 tr)
    bodysize = tRand 'β' 0 127 tr
    pickposition = tRand 'γ' 0 127 tr
    stringdamping = tRand 'δ' 0 127 tr
    stringdetune = tRand 'ε' 0 127 tr
    aftertouch = tRand 'ζ' 0 127 tr
    m = X.stkMandolin AR freq bodysize pickposition stringdamping stringdetune aftertouch tr
in pan2 m (tRand 'η' (-1) 1 tr) 0.5
