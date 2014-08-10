-- tapping tools (jmcc) #7

import Sound.SC3 {- hsc3 -}
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

tapping_tools :: UGen
tapping_tools =
    let e = envLinen 1 4 1 1
        rate = xLine KR 64 0.125 60 DoNothing
        exc = decay (impulse AR (linRand 'α' 1 21 0 * rate) 0 * 0.03) 0.001
        spc = klankSpec_mce (randN 4 'β' 400 8400) (mce [1,1,1,1]) (randN 4 'γ' 0.01 0.11)
        flt = klank exc 1 0 1 spc
    in pan2 flt (rand 'δ' (-1) 1) (envGen KR 1 1 0 1 RemoveSynth e)

pp :: UGen -> UGen
pp z = let f x = allpassN x 0.05 (mce2 (rand 'ε' 0 0.05) (rand 'ζ' 0 0.05)) 2 in useq 'η' 3 f z

main :: IO ()
main = overlapTextureU_pp (2,1,3,maxBound) tapping_tools 2 pp
