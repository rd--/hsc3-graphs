-- http://sccode.org/1-4Qy (f0)

import Sound.SC3

f0_tw0121 :: UGen
f0_tw0121 =
    let a = sinOsc
        z = a KR (1 / mce2 8 7) 0 * a KR (1 / 30) 0 * 9
        l = midiCPS (mce [56,62 .. 98])
        m = a AR (1 / mce2 4 3) 0
        o = a AR (select z l) 0 * m
    in tanh (combN o 1 (1 / mce2 6 5) 9)

main :: IO ()
main = audition (out 0 f0_tw0121)
