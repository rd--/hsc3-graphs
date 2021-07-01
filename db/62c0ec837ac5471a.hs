-- dynKlang ; fixed randomised
let f = map (\z -> randId z 600 1000) ['a'..'l']
    s = klangSpec f (replicate 12 1) (replicate 12 0)
in dynKlang ar 1 0 s * 0.05
