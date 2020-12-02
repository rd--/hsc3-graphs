-- splay ; n_set control
let i = 10
    s = control KR "spread" 1
    l = control KR "level" 0.2
    c = control KR "center" 0
    r = map (\e -> rand e 10 20) (take i ['α'..])
    ci = constant . fromIntegral
    f = mce [1 .. ci i] + 3 * 100
    n = lfNoise2 'β' KR (mce r) * 200 + f
in splay (sinOsc AR n 0) s l c True
