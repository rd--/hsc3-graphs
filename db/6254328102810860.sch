-- random panning sines (jmcc) #4 ; texture=overlap,8,8,2,inf
let nd () = let o = FSinOsc (LinRand 80 2000 0) 0
                l = LfNoise1 (Rand 0.8 1.2)
                a = LfNoise1 (Rand 0.82 0.98)
            in Pan2 o l a
in (nd !+ 8) * (0.4 / 8)
