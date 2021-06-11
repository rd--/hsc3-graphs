-- aleatoric quartet (jmcc) #7
let basemn = 66
    amp = 0.07
    density = mousex 0.01 1 linear 0.1
    dmul = recip density * 0.5 * amp
    dadd = amp - dmul
    rapf i = allpassn i 0.05 [rand 0 0.05,rand 0 0.5] 1
    mkf () = let m = lfnoise0 (listchoose [1, 0.5, 0.25]) * 7 + basemn + rand2 30
             in recip (midicps (lag (round m 1) 0.2))
    mks _ = let x = pinknoise () * max 0 (lfnoise1 8 * dmul + dadd)
            in pan2 (combl x 0.02 (mkf ()) 3) (rand2 1) 1
    g = iter 5 rapf (mixfill 5 mks)
in leakdc g 0.995
