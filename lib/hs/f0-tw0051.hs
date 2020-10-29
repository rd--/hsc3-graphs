-- http://sccode.org/1-4Qy (f0)
import Sound.SC3 {- hsc3 -}
f0_tw0051 :: UGen
f0_tw0051 =
    let ascii_u :: String -> UGen
        ascii_u = mce . map (constant . fromEnum)
        i = a (ascii_u "sunday")
        f = a (9 / ascii_u "slow") * 400 + 500
        w = a (7 / ascii_u "coding") + 1.1
        a = saw AR
        l = splay (bBandPass i f w / 5) 1 1 0 True
    in gVerb l 10 3 0.5 0.5 15 1 0.7 0.5 300 * 0.2
