-- lots-o-sins (jmcc) #2 ; texture=xfade,4,4,inf
let n = 60 {- n sines in each channel (twice as many during cross-fade) -}
    f0 = rrandn n 40 10000
    f1 = rrandn n 40 10000
    mk x = mcefill n (const x)
    o1 = klang 1 0 (klangdatamce f0 (mk 1) (mk 0))
    o2 = klang 1 0 (klangdatamce f1 (mk 1) (mk 0))
in [o1, o2] * 0.1 / n
