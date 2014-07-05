-- https://twitter.com/rukano/status/98315246548172800

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

tw :: UGen
tw =
    let h = lchoose 'α' [100,800,3000]
        o = sinOsc AR (expRand 'β' 60 h) 0 * 0.1
    in splay (uclone 'γ' 40 o) 1 1 0 True * lfGauss AR 19 (1/4) 0 NoLoop RemoveSynth

main :: IO ()
main = spawnTextureU (const 8,maxBound) tw