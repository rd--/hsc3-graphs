-- MiPlaits ; 6=chord
let harm = mouseY kr 0 1 Linear 0.2 -- select chord
    trigger = impulse kr 6 0
    lev = tRandId 'α' 0 1 trigger
in mceChannel 0 (X.miPlaits ar 40 (X.miPlaits_mode "chord") harm 0.5 0.5 trigger (lev * lev) 0 0.4 0 0.5 0.5) * 0.1
