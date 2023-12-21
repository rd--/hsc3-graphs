-- lots-o-sins (jmcc) #2 ; texture=XFade,4,4,inf
let n = 60 {- n sines in each channel (twice as many during cross-fade) -}
    f0 = RandN n 40 10000
    f1 = RandN n 40 10000
    mk x = replicate n x
    o1 = Klang 1 0 (klangDataMce f0 (mk 1) (mk 0))
    o2 = Klang 1 0 (klangDataMce f1 (mk 1) (mk 0))
in [o1,  o2] * 0.1 / n
