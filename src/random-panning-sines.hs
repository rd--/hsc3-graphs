-- random panning sines (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

rps :: UGen
rps =
    let nd = let o = fSinOsc AR (linRand 'a' 80 2000 0) 0
                 l = lfNoise1 'b' KR (rand 'b' 0.8 1.2)
                 a = lfNoise1 'c' KR (rand 'c' 0.82 0.98)
             in pan2 o l a
    in mix (upar 'a' 8 nd) * (0.4 / 8)

main :: IO ()
main = overlapTextureU (8,8,2,maxBound) rps

{-
audition (out 0 rps)
Sound.SC3.UGen.Dot.draw rps
-}
