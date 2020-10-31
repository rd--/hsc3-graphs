-- https://twitter.com/redFrik/status/454598285861617665 (f0)

import Sound.SC3 {- hsc3 -}

f0_tw_454598285861617665 :: UGen
f0_tw_454598285861617665 =
    let b = mce [9,8 .. 1]
        c = lfTri AR (3 ** lfTri AR (1 / b) (b / 9)) 0
        d = lfTri AR (1 / b) 0 `modE` 1 / 9 + 0.01
        f = 2 ** roundE (lfTri AR (b / 99) 0) * 99 * b
        o = grainSin 2 c d f 0 (-1) 512
    in splay (tanh o) 1 1 0 True / 2