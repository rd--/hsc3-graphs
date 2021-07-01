-- cymbalism accelerando (jmcc) #2 ; texture=overlap,4,4,4,inf
let y _ = let f1 = rand 500 2500
              f = mceFill 15 (\_ -> rand f1 (f1 + rand 0 8000))
              rt = mceFill 15 (\_ -> rand 1 5)
        in klankSpec_mce f (mceFill 15 (const 1)) rt
    z = mceFill 2 y
    w = whiteNoise ar * 0.02
    tf = xLine kr (linRand 0.5 4.5 0) (rand 0.5 35.5) 12 DoNothing
    t = impulse ar tf 0
    s = decay t 0.004 * w
in klank s 1 0 1 (mceTranspose z)
