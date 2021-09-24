-- stkMoog ; sequence
let nsigId z l r f = range l r (lfNoise2Id z kr f)
    scl = asLocalBufId 'α' [0,2,3.2,5,7,9,10]
    mnn = 48 + degreeToKey scl (nsigId 'β' 0 15 0.35) 12
    freq = midiCps mnn
    filterQ = nsigId 'γ' 0 64 0.5
    sweeprate = nsigId 'δ' 0 64 0.5
    vibfreq = nsigId 'ε' 0 64 0.5
    vibgain = nsigId 'ζ' 0 16 0.5
    gain = nsigId 'η' 16 96 0.5
in X.stkMoog ar freq filterQ sweeprate vibfreq vibgain gain 1
