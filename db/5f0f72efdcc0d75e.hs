-- synthetic piano (jmcc) #3 ; texture=overlap,6,0,6,inf ; id
let n = iRandId 'α' 36 90
    f = randId 'β' 0.1 0.5
    ph = randId 'γ' 0 1
    s = impulse ar f ph * 0.1
    e = decay2 s 0.008 0.04
    c z o = let n0 = lfNoise2Id z ar 3000
                dt = 1 / midiCPS (n + o)
            in combL (n0 * e) dt dt 6
    l = ((n - 36) / 27) - 1
    c_ = sum_opt (zipWith c ['δ'..] [-0.05,0,0.04])
in pan2 c_ l 1
