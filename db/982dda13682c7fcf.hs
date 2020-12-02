-- MiRings ; sympathetic strings
let tr = dust 'α' KR 1
    pit = roundE (range 30 60 (latch (whiteNoise 'β' KR) tr))
    struct = range 0 1 (lfNoise2 'γ' KR 0.4)
in X.miRings AR 0 0 pit struct 0.5 0.7 0.25 (X.miRings_mode "SYMPATHETIC_STRING") 4 0 0 0 * 0.25
