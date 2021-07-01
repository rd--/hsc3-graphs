-- klang ; id
let f = map (\z -> randId z 600 1000) ['a'..'l']
    s = klangSpec f (replicate 12 1) (replicate 12 0)
in klang ar 1 0 s * 0.02
