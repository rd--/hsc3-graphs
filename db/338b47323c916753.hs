-- MiRings ; inharmonic string
let tr = dustId 'α' kr 3
    trPit = dustId 'β' kr 0.5
    pit = range 30 60 (latch (whiteNoiseId 'γ' kr) trPit)
    struct = range 0.1 1 (latch (pinkNoiseId 'δ' kr) tr)
in X.miRings ar 0 tr pit struct 0.5 0.8 0.25 (X.miRings_mode "MODULATED/INHARMONIC_STRING") 4 0 0 0 * 0.25
