-- alien meadow (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

alien_meadow :: UGen
alien_meadow =
    let a = rand 'a' 0 20
        b = rand 'b' 0 5000
        c = rand 'c' 0 20
        p = rand 'd' (-1) 1
        f = sinOsc AR a 0 * b * 0.1 + b
    in pan2 (sinOsc AR f 0) p (sinOsc AR c 0 * 0.05 + 0.05)

main :: IO ()
main = overlapTextureU (6,2,6,maxBound) alien_meadow
