-- f0
-- instance of unworkable graph given current Eq implementation!

import Sound.SC3 {- hsc3 -}

f0_0011 :: UGen
f0_0011 =
    let ifE a b c = (a * b) + ((1 - a) * c)
        s o i = sinOsc AR (mce [i,i + 1e-4] ** 2 * f o (i - 1)) (f o (i - 1) * 1e-4) * f o (i - 1)
        f o i = ifE (i >* 0) (s o i) o
    in out 0 (f 60 6 / 60)

main :: IO ()
main = audition f0_0011
