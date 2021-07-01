-- ring modulated klank (jmcc) #2 ; texture=overlap,4,4,4,inf
let p = 8
    k = let sp = klankSpec_mce (X.rRandN p 100 10000)
                               (mceFill p (const 1))
                               (X.rRandN p 0.2 1)
        in klank (dust ar 20 * 0.02) 1 0 1 sp
    f = lfNoise2 kr (rand 0.1 0.4) * 200 + rand 350 400
in pan2 (sinOsc ar f 0 * k) (rand (-1) 1) 1
