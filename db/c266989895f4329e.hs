-- splay ; n_set control
let i = 10
    s = control kr "spread" 1
    l = control kr "level" 0.2
    c = control kr "center" 0
    r = map (\e -> randId e 10 20) (take i ['α'..])
    ci = constant . fromIntegral
    f = mce [1 .. ci i] + 3 * 100
    n = lfNoise2Id 'β' kr (mce r) * 200 + f
in splay (sinOsc ar n 0) s l c True
