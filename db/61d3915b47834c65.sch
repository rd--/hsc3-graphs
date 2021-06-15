-- http://sccode.org/1-4Qy (f0)
let z = sinosc [1/8, 1/7] 0 * sinosc (1/30) 0 * 9
    l = map midicps [56, 62 .. 98]
    m = sinosc [1/4, 1/3] 0
    o = sinosc (cr (select z l)) 0 * m
in tanh (combn o 1 [1/6, 1/5] 9) * 0.1
