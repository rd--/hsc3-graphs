-- envCoord ; start and end reset randomly every 4 seconds, ramp every trigger
let tr = impulse kr (1/4) 0
    f0 = tExpRandId 'α' 110 450 tr
    f1 = tExpRandId 'β' 110 440 tr
    p = envCoord [(0,0),(0,f0),(4,f1)] 1 1 EnvExp
    e = envGen kr tr 1 0 1 DoNothing p
in splay (sinOsc ar (mce [f0,e,f1]) 0) 1 1 0 True * mce [0.05,0.1,0.05]
