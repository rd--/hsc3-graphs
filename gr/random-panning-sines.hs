-- random panning sines (jmcc) #4

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

rps :: UGen
rps =
    let nd = let o = fSinOsc AR (linRand 'α' 80 2000 0) 0
                 l = lfNoise1 'β' KR (rand 'γ' 0.8 1.2)
                 a = lfNoise1 'δ' KR (rand 'ε' 0.82 0.98)
             in pan2 o l a
    in mix (uclone 'ζ' 8 nd) * (0.4 / 8)

main :: IO ()
main = overlapTextureU (8,8,2,maxBound) rps
