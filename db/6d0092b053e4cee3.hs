-- klang
let f = map (\z -> rand z 600 1000) ['a'..'l']
    s = klangSpec f (replicate 12 1) (replicate 12 0)
in klang AR 1 0 s * 0.02
