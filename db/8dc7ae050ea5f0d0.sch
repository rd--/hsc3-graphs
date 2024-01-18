-- https://twitter.com/sluyterrific_sc/status/570012853274615808 (es) ; edit=rd
let t = [Dust2 9, Dust2 9]
    a = LfNoise2 0.1 * 9 + 9
    s = VarSaw (TExpRand 9 5000 t) 0 0.5 * Decay t 1
in GreyholeRaw (mceChannel s 0) (mceChannel s 1) a 0 0.1 (LfNoise2 1) (LfNoise2 1 + 1) 2 a
