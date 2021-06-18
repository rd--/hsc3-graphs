-- resonant dust (jmcc) #2 ; texture=overlap,5,2,9,inf
let rf = let st = rand 80 2080
             en = st + (rand (-0.5) 0.5 * st)
         in xline st en 9 donothing
    d = dust (rand 50 850) * 0.3
in pan2 (resonz d rf 0.1) (rand2 1) 1
