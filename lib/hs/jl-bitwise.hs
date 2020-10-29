-- a0f253ff89f6b244ea29a1e431dd9e5df5571a8b (jl)

import Data.Bits {- base -}
import Sound.SC3 {- hsc3 -}

bitwise_operators :: UGen
bitwise_operators =
    let t = pulseCount (impulse AR 8e3 0) 0
        s = ((((t * 15) .&. (t .>>. 5)) .|.
              ((t *  5) .&. (t .>>. (mce2 3 4))) .|.
              ((t *  2) .&. (t .>>. 9)) .|.
              ((t *  8) .&. (t .>>. 11))) - 3) `modE` 256
    in tanh (hpf (((s / 127) - 1) * 3) 20) * 0.02
