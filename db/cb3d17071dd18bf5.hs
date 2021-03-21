-- modDif ; wrapping amplitude crossfade
let nc = 12
    nc_u = constant nc
    x = sinOsc AR (X.rRandN nc 'α' 300 800) 0
    d = modDif (mouseX KR 0 (nc_u * 2) Linear 0.2) (mce [0 .. nc_u - 1]) nc_u
in splay (x * max 0 (1 - d)) 1 1 0 True * 0.1
