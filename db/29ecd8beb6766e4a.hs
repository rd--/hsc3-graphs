-- stkMoog ; sequence
let nsig z l r f = range l r (lfNoise2 z KR f)
    scl = asLocalBuf 'α' [0,2,3.2,5,7,9,10]
    mnn = 48 + degreeToKey scl (nsig 'β' 0 15 0.35) 12
    freq = midiCPS mnn
    filterQ = nsig 'γ' 0 64 0.5
    sweeprate = nsig 'δ' 0 64 0.5
    vibfreq = nsig 'ε' 0 64 0.5
    vibgain = nsig 'ζ' 0 16 0.5
    gain = nsig 'η' 16 96 0.5
in X.stkMoog AR freq filterQ sweeprate vibfreq vibgain gain 1
