-- bowed string (jmcc) ; texture=overlap,5,2,12,inf
let root = 5
    scale = map (+ root) [0,2,4,5,7,9,11]
    oct = [24,36,48,60,72,84]
    f = midicps (listchoose scale + listchoose oct)
    x = [brownnoise (), brownnoise ()] * 0.007 * max 0 (lfnoise1 (exprand 0.125 0.5) * 0.6 + 0.4)
    geom n i z = iterate n (* z) i
    iota n i z = iterate n (+ z) i
    d = klankdata (iota 12 f f) (geom 12 1 (rand 0.7 0.9)) (listfill 12 (\_ -> rand 1.0 3.0))
    k = klank x 1 0 1 d
in softclip (k * 0.1)
