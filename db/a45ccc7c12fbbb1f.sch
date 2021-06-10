-- http://sccode.org/1-4Qy (f0)
let z = lftri [1/7, 1/8] 0 * lftri (1/9) 0 * 99
    l = map midicps [60 .. 79]
    f = select z l
    w = lftri [1/3, 1/4] 0 % 1
    o = varsaw (krate f) 0 (krate w)
in combn o 1 [1/5, 1/6] 8 / 8
