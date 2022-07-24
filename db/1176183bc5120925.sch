-- resonant Dust (jmcc) #2 ; texture=overlap,5,2,9,inf
let rf = let st = Rand 80 2080
             en = st + (Rand (-0.5) 0.5 * st)
         in XLine st en 9 doNothing
    d = Dust (Rand 50 850) * 0.3
in Pan2 (Resonz d rf 0.1) (Rand2 1) 1
