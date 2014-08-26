-- resonators harmonic series (jmcc) #2

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Collection as C {- hsc3-lang -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

rand2 :: ID a => a -> UGen -> UGen
rand2 z n = rand z (negate n) n

rhs :: UGen
rhs =
    let p = 12
        noise = brownNoise 'α' AR * 0.001
        rat = [1.0,1.125,1.25,1.333,1.5,1.667,1.875,2.0,2.25,2.5,2.667,3.0,3.333,3.75,4.0]
        freq = lchoose 'β' rat * 120
        resFreqs = zipWith (+) (C.series p freq freq) (uclone' 'γ' p (rand2 'δ' 0.5))
        spec = klankSpec
               resFreqs
               (map (\i -> 1 / (constant i + 1)) [0 .. p - 1])
               (uclone' 'ε' p (rand 'ζ' 0.5 4.5))
    in uclone 'η' 2 (klank noise 1 0 1 spec)

main :: IO ()
main = xfadeTextureU (1,7,maxBound) rhs
