-- http://sccode.org/1-4Qy (f0)
let f = saw (map (* 19) [5,7..15]) * 99 + 199
    g = saw (map (* 29) [1,3..13]) * 199 + 299
    w = saw ([3,5..11] * (saw 3 * 2 + 3)) * 299 + 399
in splay (formant f g w) 1 1 0 true / 9
