-- noise modulated sawtooths (jmcc) #6

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

nms :: UGen
nms =
    let f = midiCPS (rand 'α' 60 100)
        o = lfSaw AR (mce2 f (f + 0.2)) 0
        a = lfNoise2 'β' KR (f * mce2 0.15 0.16) * 0.1
    in o * a

nms_pp :: (UGen -> UGen)
nms_pp i = combN i 0.3 0.3 4 + mceReverse i

main :: IO ()
main = overlapTextureU_pp (4,4,4,maxBound) nms 2 nms_pp
