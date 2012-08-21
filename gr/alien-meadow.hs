-- alien meadow (jmcc)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

-- > Sound.SC3.UGen.Dot.draw alien_meadow
alien_meadow :: UGen
alien_meadow =
    let a = rand 'α' 0 20
        b = rand 'α' 0 5000
        c = rand 'α' 0 20
        p = rand 'α' (-1) 1
        f = sinOsc AR a 0 * b * 0.1 + b
    in pan2 (sinOsc AR f 0) p (sinOsc AR c 0 * 0.05 + 0.05)

main :: IO ()
main = overlapTextureU (2,6,6,maxBound) alien_meadow
