-- stkMandolin
let x = mouseX kr 0.25 16 Linear 0.2
    tr = impulse kr x 0 - 0.5
    freq = midiCPS (tiRandId 'α' 32 96 tr)
    bodysize = tRandId 'β' 0 127 tr
    pickposition = tRandId 'γ' 0 127 tr
    stringdamping = tRandId 'δ' 0 127 tr
    stringdetune = tRandId 'ε' 0 127 tr
    aftertouch = tRandId 'ζ' 0 127 tr
    m = X.stkMandolin ar freq bodysize pickposition stringdamping stringdetune aftertouch tr
in pan2 m (tRandId 'η' (-1) 1 tr) 0.5
