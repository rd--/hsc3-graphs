-- MiRings ; 5=STRING_AND_REVERB --> spacey ; force 'internal exciter'
let input = pinkNoise 'α' AR * 0.2
    tr = dust 'β' KR 0.7
    struct = range 0 1 (lfNoise1 'γ' KR 0.4)
    pos = range 0 1 (lfNoise2 'δ' KR 0.1)
in X.miRings AR input tr 60 struct 0.5 0.7 pos (X.miRings_mode "STRING_AND_REVERB") 4 1 0 0 * 0.25
