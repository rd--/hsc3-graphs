-- varSaw ; http://sc-users.bham.ac.narkive.com/sj4Tw3ub/sync-osc#post6
let freq = control kr "freq" 110
    factor = control kr "factor" 1
    x = mouseX kr 0 1.0 Linear 0.2
    y = mouseY kr (mce2 23 17) 0 Linear 0.2
    t = impulse kr 0.5 0
    ph = varSaw ar (freq * factor * tChooseId 'α' t (mce [0.125,0.5,1.3,1.5,23.0])) 0 x * y
in sinOsc ar (freq * mce2 1.001 1) ph * 0.1
