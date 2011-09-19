-- clustered sines (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

cs :: UGen
cs =
    let n = 80
        f1 = rand 'a' 100 1100
        f2 = 4 * f1
        sp = let y = (udup' n (f1 + rand 'a' 0 f2))
             in klangSpec y (map (f1 /) y) (replicate n 0)
    in uclone 'a' 2 (klang AR 1 0 sp * (0.3 / fromIntegral n))

main :: IO ()
main = xfadeTextureU (4,4,maxBound) cs

{-
audition (out 0 cs)
Control.Concurrent.forkIO (Sound.SC3.UGen.Dot.draw (out 0 cs))
-}
