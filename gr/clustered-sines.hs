-- clustered sines (jmcc) #2

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

-- > synthstat cs
cs :: UGen
cs =
    let n = 80
        f1 = rand 'α' 100 1100
        f2 = 4 * f1
        sp = let y = uclone' 'α' n (f1 + rand 'α' 0 f2)
             in klangSpec y (map (f1 /) y) (replicate n 0)
    in uclone 'α' 2 (klang AR 1 0 sp * (0.3 / fromIntegral n))

main :: IO ()
main = xfadeTextureU (4,4,maxBound) cs
