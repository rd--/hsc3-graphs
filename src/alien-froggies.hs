-- alien froggies (jmcc)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

alien_froggies :: UGen -> (UGen,UGen)
alien_froggies r =
    let r' = fold (r * exp (linRand 'a' (-0.2) 0.2 0)) 1 30
        o = formant AR r' (expRand 'b' 200 3000) (rand 'c' 0 9 * r' + r')
    in (o * 0.05,r')

main :: IO ()
main = overlapTextureS (0.25,0.5,5,maxBound) alien_froggies 11
