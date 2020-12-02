-- stkModalBar ; https://ccrma.stanford.edu/software/stk/classstk_1_1ModalBar.html
let x = mouseX KR 0.25 12 Linear 0.2
    tr = impulse KR x 0 - 0.5
    freq = midiCPS (tiRand 'α' 25 96 tr)
    instrument = tiRand 'β' 0 9 tr -- Marimba, Vibraphone, Agogo, Wood1, Reso, Wood2, Beats, Two Fixed, Clump
    stickhardness = tRand 'γ' 0 127 tr
    stickposition = tRand 'δ' 0 127 tr
    vibratogain = tRand 'ε' 0 127 tr
    vibratofreq = tRand 'ζ' 0 127 tr
    directstickmix = tRand 'η' 0 127 tr
    volume = tRand 'θ' 0 127 tr
in X.stkModalBar AR freq instrument stickhardness stickposition vibratogain vibratofreq directstickmix volume tr