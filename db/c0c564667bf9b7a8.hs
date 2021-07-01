-- MiRings ; sympathetic strings
let tr = dustId 'α' kr 1
    pit = roundE (range 30 60 (latch (whiteNoiseId 'β' kr) tr))
    struct = range 0 1 (lfNoise2Id 'γ' kr 0.4)
in X.miRings ar 0 0 pit struct 0.5 0.7 0.25 (X.miRings_mode "SYMPATHETIC_STRING") 4 0 0 0 * 0.25
