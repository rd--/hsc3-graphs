-- https://twitter.com/sluyterrific_sc/status/570012853274615808 (es) ; edit=rd
let t = [dust2 9, dust2 9]
    a = lfnoise2 0.1 * 9 + 9
    s = varsaw (texprand 9 5000 t) 0 0.5 * decay t 1
in greyholeraw (mcechannel s 0) (mcechannel s 1) a 0 0.1 (lfnoise2 1) (lfnoise2 1 + 1) 2 a
