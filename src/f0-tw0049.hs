-- f0 -- tweet0049
-- https://www.listarc.bham.ac.uk/lists/sc-users/msg18379.html

import Data.Bits -- .&.
import Sound.SC3

f0_0049 :: UGen
f0_0049 =
    let t = t2A 0 0
        o0 = lfSaw AR 3 0 * 9 + 99
        s0 = sweep t (mce [3..9]) `modE` o0
        s1 = sweep t (mce [33,32..3]) `modE` 128 .&. s0
        o1 = sinOsc AR (midiCPS (s1+33)) 0 * pi
    in out 0 (splay (sinOsc AR 9 o1) 1 1 0 True / 3)

main :: IO ()
main = audition f0_0049
