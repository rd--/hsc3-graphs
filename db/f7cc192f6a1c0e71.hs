-- dbufwr ; uid graph
let b = asLocalBuf 'α' (replicate 24 210)
    s = dseq 'β' dinf (mce2 (dseries 'γ' 16 1 1) (dwhite 'δ' 8 1 16))
    rp = dseries 'ε' dinf 0 1 {- read pointer -}
    wp = dseq 'ζ' dinf (mce2 (dseries 'η' 30 0 3) (dseries 'θ' 30 0 1)) {- write pointer -}
    r = dbufrd 'ι' b rp Loop {- reader -}
    w = dbufwr 'κ' b wp (s * 60) Loop {- writer -}
    d = demand (dust 'λ' KR 1) 0 w
    f = lag (demand (impulse KR 16 0) 0 r) 0.01
    o = sinOsc AR (f * mce2 1 1.01) 0 * 0.1
in mrg2 d (out 0 o)
