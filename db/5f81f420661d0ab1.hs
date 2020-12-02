-- MiPlaits ; 8=swarm ; super saw
let pit = tiRand 'α' 39 49 (dust 'β' KR 0.5)
    c0 = head . mceChannels
in c0 (X.miPlaits AR pit (X.miPlaits_mode "swarm") 0.16 0 1 0 0 0 0 0 0.5 0.5) * 0.1
