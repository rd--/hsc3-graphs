-- http://sccode.org/1-4Qy (f0)

import Sound.SC3 {- hsc3 -}

-- > Sound.SC3.UGen.Dot.draw f0_tw0084
f0_tw0084 :: UGen
f0_tw0084 =
    let a = saw AR
        f = a (mce [5,7..15] * 19) * 99 + 199
        g = a (mce [1,3..13] * 29) * 199 + 299
        w = a (mce [3,5..11] * (a 3 * 2 + 3)) * 299 + 399
    in splay (formant AR f g w) 1 1 0 True / 3

main :: IO ()
main = audition (out 0 f0_tw0084)
