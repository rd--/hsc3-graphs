-- MiRings ; simple vibrato
let tr = dust 'α' KR 0.5
    pit = range 36 48 (latch (whiteNoise 'β' KR) tr)
    vib = sinOsc KR 3 0
in X.miRings AR 0 0 (pit + vib) 0.2 0.5 0.7 0.25 (X.miRings_mode "MODAL_RESONATOR") 1 0 0 0
