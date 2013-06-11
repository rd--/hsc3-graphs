-- http://sccode.org/1-4Qy (f0)

import Sound.SC3

f0_tw0125 :: UGen
f0_tw0125 =
    let a = sinOsc AR
        f = a (1 / mce [8,9]) 0 * 4 + mce [400,202]
        u = (a (1/9) 0 + 1) / 88
        d = (a (1/8) 0 + 1) / 99
        i = inFeedback 1 (mce [1,0])
        p = combC (lagUD i u d) 1 0.08 9
    in a f p

main :: IO ()
main = audition (out 0 f0_tw0125)
