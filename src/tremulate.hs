-- tremulate (jmcc)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}

tremulate :: UGen
tremulate =
    let f = rand 'a' 500 900
        o = fSinOsc AR (f * mce [1,1.2,1.5,1.8]) 0
        r = randN 4 'a' 30 90
        a = max 0 (lfNoise2 'a' KR r) * 0.1
        l = randN 4 'a' (-1) 1
    in mix (pan2 o l a)

tremulate_pp :: UGen -> UGen
tremulate_pp i = combN i 0.1 0.1 1

main :: IO ()
main = xfadeTextureU_pp (0.5,2,maxBound) tremulate 2 tremulate_pp

{-
audition (out 0 tremulate)
Sound.SC3.UGen.Dot.draw tremulate
-}
