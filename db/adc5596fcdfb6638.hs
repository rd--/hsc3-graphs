-- stkBandedWG
let tr = impulse kr (mouseX kr 0.5 12 Linear 0.2) 0 - 0.5
    freq = midiCps (tExpRandId 'α' 24 96 tr)
    instr = 3 -- Uniform Bar = 0, Tuned Bar = 1, Glass Harmonica = 2, Tibetan Bowl = 3
    modalresonance = tRandId 'ζ' 0 127 tr
in X.stkBandedWG ar freq instr 0 0 0 modalresonance 0 0 tr
