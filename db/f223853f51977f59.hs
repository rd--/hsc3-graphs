-- MiBraids ; sample rate, bit reduction and distortion
let tr = coinGate 'α' 0.3 (impulse KR 4 0)
    decim = tRand 'β' 1 32 tr
    dist = range 0 1 (lfTri KR 0.2 0)
in X.miBraids AR 40 0.7 0.7 (X.miBraids_mode "KICK") tr 2 decim 3 dist * 0.1
