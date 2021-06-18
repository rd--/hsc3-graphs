-- random panning sines (jmcc) #4 ; texture=overlap,8,8,2,inf
let nd _ = let o = fsinosc (linrand 80 2000 0) 0
               l = lfnoise1 (rand 0.8 1.2)
               a = lfnoise1 (rand 0.82 0.98)
           in pan2 o l a
in mixfill 8 nd * (0.4 / 8)
