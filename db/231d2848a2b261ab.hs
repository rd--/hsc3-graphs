-- klank ; there is a limited form of mce
let u = [1,1,1,1]
    p = [200,171,153,172]
    q = [930,971,953,1323]
    r = [8900,16062,9013,7892]
    k = mce [klankSpec_k p u u,klankSpec_k q u u,klankSpec_k r u u]
    s = mceTranspose k
    i = mce [2,2.07,2.13]
    t = impulse ar i 0 * 0.1
    l = mce [-1,0,1]
in mix (pan2 (klank t 1 0 1 s) l 0.25)
