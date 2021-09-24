-- stkModalBar
let x = mouseX kr 1 12 Linear 0.2
    tr = impulse kr x 0 - 0.5
    tr3 = pulseDivider tr 3 0
    freq = midiCps (tiRandId 'α' 52 64 tr)
    instrument = 1
    stickhardness = tRandId 'β' 10 50 tr3
    stickposition = tRandId 'γ' 40 80 tr3
    vibratogain = tRandId 'δ' 66 98 tr3
    vibratofreq = tRandId 'ε' 4 12 tr3
    directstickmix = tRandId 'ζ' 0 1 tr3
    volume = tRandId 'η' 16 48 tr3
in X.stkModalBar ar freq instrument stickhardness stickposition vibratogain vibratofreq directstickmix volume tr
