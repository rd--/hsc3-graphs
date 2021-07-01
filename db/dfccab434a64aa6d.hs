-- dbufwr ; uid graph
let b = asLocalBufId 'α' (replicate 24 210)
    s = dseqId 'β' dinf (mce2 (dseriesId 'γ' 16 1 1) (dwhiteId 'δ' 8 1 16))
    rp = dseriesId 'ε' dinf 0 1 {- read pointer -}
    wp = dseqId 'ζ' dinf (mce2 (dseriesId 'η' 30 0 3) (dseriesId 'θ' 30 0 1)) {- write pointer -}
    r = dbufrdId 'ι' b rp Loop {- reader -}
    w = dbufwrId 'κ' b wp (s * 60) Loop {- writer -}
    d = demand (dustId 'λ' kr 1) 0 w
    f = lag (demand (impulse kr 16 0) 0 r) 0.01
    o = sinOsc ar (f * mce2 1 1.01) 0 * 0.1
in mrg2 d (out 0 o)
