-- MiRings ; inharmonic string
let tr = dust 'α' KR 3
    trPit = dust 'β' KR 0.5
    pit = range 30 60 (latch (whiteNoise 'γ' KR) trPit)
    struct = range 0.1 1 (latch (pinkNoise 'δ' KR) tr)
in X.miRings AR 0 tr pit struct 0.5 0.8 0.25 (X.miRings_mode "MODULATED/INHARMONIC_STRING") 4 0 0 0 * 0.25
