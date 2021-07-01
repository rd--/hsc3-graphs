-- MiRings ; 5=STRING_AND_REVERB --> spacey ; forceId 'internal exciter'
let md = X.miRings_mode "STRING_AND_REVERB"
    input = pinkNoiseId 'α' ar * 0.2
    tr = dustId 'β' kr 0.7
    struct = range 0 1 (lfNoise1Id 'γ' kr 0.4)
    pos = range 0 1 (lfNoise2Id 'δ' kr 0.1)
in X.miRings ar input tr 60 struct 0.5 0.7 pos md 4 1 0 0 * 0.25
