-- stkModalBar ; https://ccrma.stanford.edu/software/stk/classstk_1_1ModalBar.html
let x = mouseX kr 0.25 12 Linear 0.2
    tr = impulse kr x 0 - 0.5
    freq = midiCPS (tiRandId 'α' 25 96 tr)
    instrument = tiRandId 'β' 0 9 tr -- Marimba, Vibraphone, Agogo, Wood1, Reso, Wood2, Beats, Two Fixed, Clump
    stickhardness = tRandId 'γ' 0 127 tr
    stickposition = tRandId 'δ' 0 127 tr
    vibratogain = tRandId 'ε' 0 127 tr
    vibratofreq = tRandId 'ζ' 0 127 tr
    directstickmix = tRandId 'η' 0 127 tr
    volume = tRandId 'θ' 0 127 tr
in X.stkModalBar ar freq instrument stickhardness stickposition vibratogain vibratofreq directstickmix volume tr
