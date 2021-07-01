-- MiPlaits ; some FM
let harm = mouseX kr 0 1 Linear 0.2
    timbre = mouseY kr 0 1 Linear 0.2
    morph = range 0 1 (lfNoise2Id 'α' kr 0.2)
    trigger = impulse ar 8 0
in X.miPlaits ar 48 (X.miPlaits_mode "fm") harm timbre morph trigger 0 0 0 0 0.5 0.5 * 0.1
