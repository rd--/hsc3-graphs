-- hard sync sawtooth with lfo (jmcc) #6

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

hsswl :: UGen
hsswl =
    let f = midiCPS (30 + iRand 'α' 0 50)
        o = sinOsc KR 0.2 (mce [0, rand 'β' 0 (2 * pi)]) * (2 * f) + (3 * f)
    in syncSaw AR (mce [f, f + 0.2]) o * 0.05

pp :: UGen -> UGen
pp z = combN z 0.3 0.3 4 + mceReverse z

main :: IO ()
main = overlapTextureU_pp (4,4,4,maxBound) hsswl 2 pp
