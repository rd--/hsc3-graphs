-- MiPlaits ; 6=chord
let harm = mouseY KR 0 1 Linear 0.2 -- select chord
    trigger = impulse KR 6 0
    lev = tRand 'α' 0 1 trigger
    c0 = head . mceChannels
in c0 (X.miPlaits AR 40 (X.miPlaits_mode "chord") harm 0.5 0.5 trigger (lev * lev) 0 0.4 0 0.5 0.5) * 0.1
