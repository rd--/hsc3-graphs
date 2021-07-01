-- uplink (jmcc) #2 ; texture=overlap,4,1,5,inf ; id
let r = rand0Id
    p0 = lfPulse kr (r 'α' 20) 0 (r 'β' 1)
    p1 = lfPulse kr (r 'γ' 4) 0 (r 'δ' 1) * r 'ε' 8000 + r 'ζ' 2000
    f = mix (Protect.uclone_all 'η' 2 (p0 * p1))
in pan2 (lfPulse ar f 0 0.5 * 0.04) (randId 'θ' (-0.8) 0.8) 1
