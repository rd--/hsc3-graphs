-- random pulsations (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Events.OverlapTexture

rp :: UGen
rp =
    let o1 = fSinOsc AR (rand 'a' 0 2000) 0 * 0.02
        o2 = sinOsc AR (linRand 'b' 8 88 0) 0
        o3 = sinOsc KR (rand 'c' 0.3 0.8) (rand 'd' 0 (2 * pi)) * 0.7
    in pan2 (o1 `amClip` o2) o3 1

main :: IO ()
main = overlapTextureU (2,5,8,maxBound) rp
