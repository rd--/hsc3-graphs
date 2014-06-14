-- choip (jmcc) #10

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.External.RDU.ID {- sc3-rdu -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

xl :: ID a => a -> a -> UGen -> UGen -> UGen -> UGen
xl e0 e1 l r t = xLine KR (expRand e0 l r) (expRand e1 l r) t DoNothing

r2 :: ID a => a -> UGen -> UGen
r2 e n = rand e (-n) n

choip :: UGen
choip =
    let t = 12
        i = impulse AR (xl 'α' 'β' 1 30 t) 0
        f = xl 'γ' 'δ' 600 8000 t
        a = sinOsc AR (decay2 i 0.05 0.5 * (-0.9 * f) + f) 0
        l = line KR (r2 'ε' 1) (r2 'ζ' 1) t DoNothing
    in pan2 (decay2 (i * xl 'η' 'θ' 0.01 0.5 t) 0.01 0.2 * a) l 1

choip_pp :: UGen -> UGen
choip_pp =
    let f x = allpassN x 0.1 (randN 2 'ι' 0 0.05) 4
    in useq 'κ' 4 f

main :: IO ()
main = overlapTextureU_pp (10,1,8,maxBound) choip 2 choip_pp
