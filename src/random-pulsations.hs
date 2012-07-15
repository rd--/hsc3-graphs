-- random pulsations (jmcc)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

rp :: UGen
rp =
    let o1 = fSinOsc AR (rand 'α' 0 2000) 0 * 0.02
        o2 = sinOsc AR (linRand 'α' 8 88 0) 0
        o3 = sinOsc KR (rand 'α' 0.3 0.8) (rand 'α' 0 (2 * pi)) * 0.7
    in pan2 (o1 `amClip` o2) o3 1

main :: IO ()
main = overlapTextureU (2,5,8,maxBound) rp
