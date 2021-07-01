-- narrow band filtered crackle noise (jmcc) #2 ; texture=spawn,2,inf
let e = envLinen 2 5 2 1
    rf1 = rand 0 2000 + 80
    rf2 = rf1 + (rand2 0.2 * rf1)
    rf = xLine kr rf1 rf2 9 DoNothing
    c = crackle ar (1.97 + rand 0 0.03) * 0.15
in pan2 (resonz c rf 0.2) (rand2 1) (envGen ar 1 1 0 1 RemoveSynth e)
