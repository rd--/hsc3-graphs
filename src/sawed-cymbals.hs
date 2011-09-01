-- sawed cymbals (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

sawed_cymbals :: UGen
sawed_cymbals =
    let y = let f1 = rand 'a' 500 2500
                f2 = rand 'a' 0 8000
                f = udup' 15 (rand 'a' f1 (f1 + f2))
                rt = udup' 15 (rand 'a' 2 6)
          in klankSpec f (replicate 15 1) rt
        z = upar 'a' 2 y
        fS = xLine KR (rand 'α' 0 600) (rand 'β' 0 600) 12 DoNothing
    in klank (lfSaw AR fS 0 * 0.0005) 1 0 1 (mceTranspose z)

main :: IO ()
main = overlapTextureU (4,4,6,maxBound) sawed_cymbals
