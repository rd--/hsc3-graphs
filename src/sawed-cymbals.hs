-- sawed cymbals (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

enumFromN :: Enum a => a -> Int -> [Int]
enumFromN e i = let j = fromEnum e in [j .. j + i]

sawed_cymbals :: UGen
sawed_cymbals =
    let y n = let f1 = rand n 500 2500
                  f2 = rand n 0 8000
                  f = map (\e -> rand e f1 (f1 + f2)) (enumFromN n 15)
                  rt = map (\e -> rand e 2 6) (enumFromN n 15)
          in klankSpec f (replicate 15 1) rt
        z = mce2 (y 'a') (y 'A')
        fS = xLine KR (rand 'α' 0 600) (rand 'β' 0 600) 12 DoNothing
    in klank (lfSaw AR fS 0 * 0.0005) 1 0 1 (mceTranspose z)

main :: IO ()
main = overlapTextureU (4,4,6,maxBound) sawed_cymbals
