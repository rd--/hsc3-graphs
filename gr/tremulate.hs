-- tremulate (jmcc) #1

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}
import qualified Sound.SC3.UGen.External.RDU as RDU {- sc3-rdu -}

tremulate :: UGen
tremulate =
    let f = rand 'α' 500 900
        o = fSinOsc AR (f * mce [1,1.2,1.5,1.8]) 0
        r = RDU.randN 4 'β' 30 90
        a = max 0 (lfNoise2 'γ' KR r) * 0.1
        l = RDU.randN 4 'δ' (-1) 1
    in mix (pan2 o l a)

tremulate_pp :: UGen -> UGen
tremulate_pp i = combN i 0.1 0.1 1

main :: IO ()
main = O.xfadeTextureU_pp (0.5,2,maxBound) tremulate 2 tremulate_pp
