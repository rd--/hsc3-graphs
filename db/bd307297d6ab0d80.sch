-- f0 <https://twitter.com/redFrik/status/1254441448327479299> ; edit=rd
let b = [1,3,5,8,10]
    e = [3,2/3,4,3/2,2]
    c = 0.021
    d = lftri (b / 999) 0 % 1
    m = lftri (b * c) 0
    l = m * 7 + 20 + dseq dinf (b % m * 5 + 6)
    j = duty (e / (12 ** m)) 0 donothing l
    k = degreetokey (aslocalbuf 1 b) j 12
    o = sinoscfb (midicps k) (lftri (((c / b) + 1) / 3) 1 * d)
in freeverb (splay o 1 1 0 true) 0.1 1 0.5 * 0.2
