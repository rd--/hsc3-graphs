-- pulseCount ; printer (silent, see console)
let b = localBuf 'α' 11 1
    t = impulse AR 10 0
    p = pulseCount t 0
    d = demand t 0 (dbufwr 'α' (-666) b p NoLoop)
in mrg [dc AR 0,poll t p 0 (label "p")]
