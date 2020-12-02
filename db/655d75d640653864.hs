-- MiPlaits ; some talking ; 7=speech
let ptch = mouseY KR 24 72 Linear 0.2
    harm = mouseX KR 0 1 Linear 0.2
    mrph = lfSaw AR 0.11 0 * 0.5 + 0.5
in X.miPlaits AR ptch (X.miPlaits_mode "speech") harm 0.5 mrph 0 0 0 0 0 0.5 0.5 * 0.1
