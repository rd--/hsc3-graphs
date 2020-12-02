-- stkModalBar
let x = mouseX KR 1 12 Linear 0.2
    tr = impulse KR x 0 - 0.5
    tr3 = pulseDivider tr 3 0
    freq = midiCPS (tiRand 'α' 52 64 tr)
    instrument = 1
    stickhardness = tRand 'β' 10 50 tr3
    stickposition = tRand 'γ' 40 80 tr3
    vibratogain = tRand 'δ' 66 98 tr3
    vibratofreq = tRand 'ε' 4 12 tr3
    directstickmix = tRand 'ζ' 0 1 tr3
    volume = tRand 'η' 16 48 tr3
in X.stkModalBar AR freq instrument stickhardness stickposition vibratogain vibratofreq directstickmix volume tr
