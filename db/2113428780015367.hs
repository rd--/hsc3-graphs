-- resonant dust (jmcc) #2 ; texture=overlap,5,2,9,inf
let rf = let st = rand 80 2080
             en = st + (rand2 0.5 * st)
         in xLine kr st en 9 DoNothing
    d = dust ar (rand 50 850) * 0.3
in pan2 (resonz d rf 0.1) (rand (-1) 1) 1
