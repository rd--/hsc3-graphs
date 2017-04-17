-- string wander-cluster (jmcc) #6

import qualified System.Random as R {- random -}

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}

type ST = (Double,R.StdGen)

wander :: ST -> ST
wander (n,g) =
    let (n',g') = R.randomR (-7,8) g
    in (foldToRange 50 120 (n + n'),g')

swc :: ST -> (UGen,ST)
swc st =
    let (n,g) = wander st
        d = 1 / midiCPS (constant n)
        w = whiteNoise 'α' AR * 0.008
        o = combC w 0.01 d (d * 1000)
    in (pan2 o (rand 'β' (-1) 1) 1,(n,g))

main :: IO ()
main = O.overlapTextureS (4/3,4/3,6,maxBound) swc (60,R.mkStdGen 0)

swc' :: UGen
swc' =
    let n = rand 'α' 50 100
        n' = fold (n + rand 'β' 0 15 - 7) 50 120
        d = 1 / midiCPS n'
        w = whiteNoise 'γ' AR * 0.008
        o = combC w 0.01 d (d * 1000)
    in pan2 o (rand 'δ' (-1) 1) 1

main' :: IO ()
main' = O.overlapTextureU (4/3,4/3,6,maxBound) swc'
