-- http://sccode.org/1-4Qy (f0)

import Sound.SC3 {- hsc3 -}

-- > ascii "sunday" == mce (map constant [115,117,110,100,97,121])
ascii :: String -> UGen
ascii = mce . map (constant.fromEnum)

-- > Sound.SC3.UGen.Dot.draw (out 0 f0_tw0051)
f0_tw0051 :: UGen
f0_tw0051 =
    let i = a (ascii "sunday")
        f = a (9 / ascii "slow") * 400 + 500
        w = a (7 / ascii "coding") + 1.1
        a = saw AR
        l = splay (bBandPass i f w / 5) 1 1 0 True
    in gVerb l 10 3 0.5 0.5 15 1 0.7 0.5 300

main :: IO ()
main = audition (out 0 f0_tw0051)
