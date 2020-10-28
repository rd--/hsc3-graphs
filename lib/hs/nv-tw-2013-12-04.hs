-- <https://twitter.com/headcube/status/408145586970324992> (nv)

import Sound.SC3 {- hsc3 -}

mean :: Fractional a => [a] -> a
mean l = sum l / fromIntegral (length l)

f :: UGen -> UGen
f j =
    let i = j + 1;
        a = saw AR ((1 / i + 1) / 6)
        p = pluck a a 1 (1 / i / (3 - lfPulse AR (1 / i) 0 0.5) / 30) 9 (0.9 / i)
        x = (0.5 ** i) * p
        o = sinOsc AR 2 0 + mce2 4 9
    in combC x 1 (o * 0.001) 0 - x

nv :: UGen
nv = mean (map f [0 .. 8]) / 9

main :: IO ()
main = audition (out 0 nv)
