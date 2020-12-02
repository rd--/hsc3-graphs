-- MiRings ; intern_exciter ON
let input = crackle AR 1.999 * 0.2
    tr = dust 'α' AR 0.7
    bright = range 0.1 0.8 (lfNoise1 'β' KR 0.4)
    pos = range 0 1 (lfNoise2 'γ' KR 0.1)
in X.miRings AR input tr 56 0.1 bright 0.6 pos (X.miRings_mode "MODAL_RESONATOR") 3 1 0 0 * 0.35
