-- pulseCount ; printer (silent, see console)
let b = localBufId 'α' 11 1
    t = impulse ar 10 0
    p = pulseCount t 0
    d = demand t 0 (dbufwrId 'α' (-666) b p NoLoop)
in mrg [dc ar 0,poll t p 0 (label "p")]