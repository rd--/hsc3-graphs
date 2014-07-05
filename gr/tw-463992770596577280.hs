-- https://twitter.com/thormagnusson/status/463992770596577280

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

f :: Int -> UGen
f z =
    let x = fromIntegral z + 1
        e = lfNoise2 z AR 0.5 * line AR 0 0.1 (rand z 1 99) DoNothing / (x * 0.2)
    in sinOsc AR (30 * x + linLin_b (lfNoise2 z AR 0.1) (-2) 2) 0 * e

g :: UGen
g = uclone 'α' 2 (sum (map f [0 .. 23]))

main :: IO ()
main = overlapTextureU (60,15,3,maxBound) g
