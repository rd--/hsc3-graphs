-- pond life (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

pond_life :: UGen
pond_life =
    let f0 = 20 + rand 'a' 0 30
        f1 = fSinOsc KR f0 0 * rand 'b' 100 400 + linRand 'c' 500 2500 0
        a = lfPulse KR (3 / rand 'd' 1 9) (rand 'e' 0.2 0.5) 0.04
    in pan2 (sinOsc AR f1 0 * a) (rand 'f' (-1) 1) 0.5

main :: IO ()
main = overlapTextureU (8,8,4,maxBound) pond_life
