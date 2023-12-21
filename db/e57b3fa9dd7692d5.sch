-- http://sccode.org/1-4Qy (f0)
let f = Saw (map (* 19) [5,  7..15]) * 99 + 199
    g = Saw (map (* 29) [1,  3..13]) * 199 + 299
    w = Saw ([3,  5..11] * (Saw 3 * 2 + 3)) * 299 + 399
in Splay2 (Formant f g w) / 9
