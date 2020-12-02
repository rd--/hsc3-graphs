-- stkBandedWG
let tr = impulse KR (mouseX KR 0.5 12 Linear 0.2) 0 - 0.5
    freq = midiCPS (tExpRand 'α' 24 96 tr)
    instr = 3 -- Uniform Bar = 0, Tuned Bar = 1, Glass Harmonica = 2, Tibetan Bowl = 3
    modalresonance = tRand 'ζ' 0 127 tr
in X.stkBandedWG AR freq instr 0 0 0 modalresonance 0 0 tr
