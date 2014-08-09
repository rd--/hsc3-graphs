-- alien meadow (jmcc) #6

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

alien_meadow :: UGen
alien_meadow =
    let b = randU 'α' 0 5000
        f = sinOsc AR (rand 0 20) 0 * b * 0.1 + b
    in pan2 (sinOsc AR f 0) (rand (-1) 1) (sinOsc AR (rand 0 20) 0 * 0.05 + 0.05)

main :: IO ()
main = overlapTextureU (2,6,6,maxBound) alien_meadow
