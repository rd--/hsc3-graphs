-- rails (jmcc) #2 ; texture=overlap,3,2,4,inf
let n = 20 {- resonant modes -}
    e = dust ar 100 * 0.04 {- excitation -}
    f = xLine kr 3000 300 8 DoNothing {- sweep filter down -}
    l = line kr (rand2 1) (rand2 1) 8 DoNothing {- sweep pan -}
    r = X.linRandN n 200 3200 0
    a = mceFill n (const 1)
    t = X.randN n 0.2 1.2 {- ring times -}
    k = klank (resonz e f 0.2) 1 0 1 (klankSpec_mce r a t)
in pan2 k l 1
