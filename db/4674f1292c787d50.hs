-- MiRings ; simple vibrato
let tr = dustId 'α' kr 0.5
    pit = range 36 48 (latch (whiteNoiseId 'β' kr) tr)
    vib = sinOsc kr 3 0
in X.miRings ar 0 0 (pit + vib) 0.2 0.5 0.7 0.25 (X.miRings_mode "MODAL_RESONATOR") 1 0 0 0
