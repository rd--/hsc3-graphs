-- sawed cymbals (jmcc) #9

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

sawed_cymbals :: UGen
sawed_cymbals =
    let y = let f1 = rand 'α' 500 2500
                f2 = rand 'α' 0 8000
                f = uclone' 'α' 15 (rand 'α' f1 (f1 + f2))
                rt = uclone' 'α' 15 (rand 'α' 2 6)
          in klankSpec f (replicate 15 1) rt
        z = uclone 'α' 2 y
        fS = xLine KR (rand 'α' 0 600) (rand 'β' 0 600) 12 DoNothing
    in klank (lfSaw AR fS 0 * 0.0005) 1 0 1 (mceTranspose z)

main :: IO ()
main = overlapTextureU (4,4,6,maxBound) sawed_cymbals
