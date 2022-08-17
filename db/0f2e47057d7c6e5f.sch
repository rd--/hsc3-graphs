-- http://sccode.org/1-Z (jl)
let a = cr (Lag (Impulse 8 0) 0.1)
    b = Crackle (cr (Lag (Abs (LFSaw 3 0)) 0.1 * 1.8))
    c = a * b
    d = Lag (Impulse 2 0 + Impulse 4 0.5) 0.1
    e = Blip 4.9 7 * 0.4
    f = cr d * e
in Tanh (c + GVerb f 1 1 0.5 0.5 15 1 0.7 0.5 300 * 5) * 0.5
