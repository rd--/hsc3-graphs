-- string wander-cluster (jmcc) #6

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import System.Random {- random -}

type ST = (Double,StdGen)

wander :: ST -> ST
wander (n,g) =
    let (n',g') = randomR (-7,8) g
    in (foldToRange 50 120 (n + n'),g')

swc :: ST -> (UGen,ST)
swc st =
    let (n,g) = wander st
        d = 1 / midiCPS (constant n)
        w = whiteNoise 'c' AR * 0.008
        o = combC w 0.01 d (d * 1000)
    in (pan2 o (rand 'd' (-1) 1) 1,(n,g))

main :: IO ()
main = overlapTextureS (4/3,4/3,6,maxBound) swc (60,mkStdGen 0)
