-- http://sccode.org/1-4Qy (f0)
let f = sinosc [1/5, 1/6] 0 + [798, 912]
    p = (sinosc (1/16) 0 * 19 + 99) * sinosc [9, 8] 0
    m = sinosc (sinosc 6 0 * sinosc 0.009 0) 0
    b = sinosc f p * m
in tanh (sinosc [201, 301] b) * 0.1
