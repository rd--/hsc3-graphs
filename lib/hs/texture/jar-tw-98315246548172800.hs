-- https://twitter.com/rukano/status/98315246548172800 (jar)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.UGen.Protect {- hsc3-rw -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}

tw :: UGen
tw =
    let h = lchoose 'α' [100,800,3000]
        o = sinOsc AR (expRand 'β' 60 h) 0 * 0.1
    in splay (uclone_all 'γ' 40 o) 1 1 0 True * lfGauss AR 19 (1/4) 0 NoLoop RemoveSynth

main :: IO ()
main = O.spawnTextureU (const 8,maxBound) tw
