-- MiBraids ; sample rate, bit reduction and distortion
let tr = coinGateId 'α' 0.3 (impulse kr 4 0)
    decim = tRandId 'β' 1 32 tr
    dist = range 0 1 (lfTri kr 0.2 0)
in X.miBraids ar 40 0.7 0.7 (X.miBraids_mode "KICK") tr 2 decim 3 dist * 0.1
