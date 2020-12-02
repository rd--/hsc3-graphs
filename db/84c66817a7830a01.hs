-- MiPlaits ; Mouse control ; 2=fm
let harm = mouseX KR 0 1 Linear 0.2
    timb = mouseY KR 0 1 Linear 0.2
in X.miPlaits AR 48 (X.miPlaits_mode "fm") harm timb 0.5 0 0 0 0 0 0.5 0.5 * 0.1
