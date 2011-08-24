-- noise modulated sines (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Events.OverlapTexture

nms :: UGen
nms =
    let f = midiCPS (rand 'a' 60 100)
        o = fSinOsc AR (mce2 f (f + 0.2)) 0
        a = lfNoise2 'b' KR (f * mce2 0.15 0.16) * 0.1
    in o * a

nms_pp :: (UGen -> UGen)
nms_pp i = combN i 0.3 0.3 4 + mceReverse i

main :: IO ()
main = overlapTextureU_pp (4,4,4,maxBound) nms 2 nms_pp
