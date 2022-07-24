-- http://sccode.org/1-4Qy (f0)
let f = SinOsc [1/5,  1/6] 0 + [798,  912]
    p = (SinOsc (1/16) 0 * 19 + 99) * SinOsc [9,  8] 0
    m = SinOsc (SinOsc 6 0 * SinOsc 0.009 0) 0
    b = SinOsc f p * m
in Tanh (SinOsc [201,  301] b) * 0.1
