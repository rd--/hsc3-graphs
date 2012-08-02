-- saucer base (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

saucer_base :: UGen
saucer_base =
    let a = rand 'α' 0 20
        b = rand 'α' 0 1000
        c = rand 'α' 0 5000
        p = rand 'α' (-1) 1
        o = sinOsc AR a 0 * b + (1.1 * b)
        o' = sinOsc AR o 0 * c + (1.1 * c)
    in pan2 (sinOsc AR o' 0 * 0.1) p 1

main :: IO ()
main = overlapTextureU (2,6,4,maxBound) saucer_base
