-- https://twitter.com/sluyterrific_sc/status/570012853274615808 (es) ; edit=rd
let dup f = mce2 (f ()) (f ())
    -- this is not (of course) as written but sounds nicely....
    greyhole_no_reorder i = let (p,q) = unmce2 i in X.greyholeRaw p q
    t = dup (\_ -> dust2 ar 9)
    o = 0.1
    a = lfNoise2 ar o * 9 + 9
    s = varSaw ar (tExpRand 9 5000 t) 0 0.5 * decay t 1
in greyhole_no_reorder s a 0 o (lfNoise2 ar 1) (lfNoise2 ar 1 + 1) 2 a
