-- MiPlaits ; some FM
let harm = mouseX KR 0 1 Linear 0.2
    timbre = mouseY KR 0 1 Linear 0.2
    morph = range 0 1 (lfNoise2 'α' KR 0.2)
    trigger = impulse AR 8 0
in X.miPlaits AR 48 (X.miPlaits_mode "fm") harm timbre morph trigger 0 0 0 0 0.5 0.5 * 0.1
