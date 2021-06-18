-- http://sccode.org/1-Z (jl)
let a = cr (lag (impulse 8 0) 0.1)
    b = crackle (cr (lag (abs (lfsaw 3 0)) 0.1 * 1.8))
    c = a * b
    d = lag (impulse 2 0 + impulse 4 0.5) 0.1
    e = blip 4.9 7 * 0.4
    f = cr d * e
in tanh (c + gverb f 1 1 0.5 0.5 15 1 0.7 0.5 300 * 5) * 0.5
