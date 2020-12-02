-- MiPlaits ; 11=string ; inharmonic
let harm = range 0 1 (lfNoise2 'α' KR 0.2)
    c0 = head . mceChannels
in c0 (X.miPlaits AR 60 (X.miPlaits_mode "string") harm 0 0.85 0 0 0 0 0 0.5 0.5)
