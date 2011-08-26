-- random panning sines (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

rps :: UGen
rps =
    let nd e = let o = fSinOsc AR (linRand e 80 2000 0) 0
                   l = lfNoise1 e KR (rand e 0.8 1.2)
                   a = lfNoise1 e KR (rand e 0.82 0.98)
               in pan2 o l a
    in mix (mce (map nd ['a'..'h'])) * (0.4 / 8)

main :: IO ()
main = overlapTextureU (8,8,2,maxBound) rps

{-
Sound.SC3.UGen.Dot.draw rps
-}
