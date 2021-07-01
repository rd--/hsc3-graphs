-- cymbalism (jmcc) #2 ; texture=overlap,3,6,6,inf
let p = 15
    spec _ = let f1 = rand 500 2500
                 f = mceFill p (\_ -> rand f1 (f1 + rand 0 8000))
                 rt = mceFill p (\_ -> rand 1 5)
             in klankSpec_mce f (mceFill p (const 1)) rt
    t = impulse ar (rand 0.5 3.5) 0
    s = whiteNoise ar * decay t 0.004 * 0.03
in mceFill 2 (\n -> klank s 1 0 1 (spec n))
