-- localBuf ; bufCombC needs no clearing, because the delay line is filled by the ugen
let dup (p,q) f = mce2 (f p) (f q)
    d = dup ('α','β') (\z -> dustId z ar 1)
    n = whiteNoiseId 'γ' ar * 0.1
    z = decay d 0.3 * n
    l = xLine kr 0.0001 0.01 20 DoNothing
    sr = sampleRate
    b = dup ('δ','ε') (\z -> localBufId z 2 sr)
in bufCombC b z l 0.2
