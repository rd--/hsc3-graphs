-- choip (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

xl :: ID a => a -> a -> UGen -> UGen -> UGen -> UGen
xl e0 e1 l r t = xLine KR (expRand e0 l r) (expRand e1 l r) t DoNothing

r2 :: ID a => a -> UGen -> UGen
r2 e n = rand e (-n) n

choip :: UGen
choip =
    let t = 12
        i = impulse AR (xl 'a' 'b' 1 30 t) 0
        f = xl 'c' 'd' 600 8000 t
        a = sinOsc AR (decay2 i 0.05 0.5 * (-0.9 * f) + f) 0
        l = line KR (r2 'e' 1) (r2 'f' 1) t DoNothing
    in pan2 (decay2 (i * xl 'g' 'h' 0.01 0.5 t) 0.01 0.2 * a) l 1

choip_pp :: UGen -> UGen
choip_pp =
    let f x = allpassN x 0.1 (udup 2 (rand 'a' 0 0.05)) 4
    in useq 'a' 4 f

main :: IO ()
main = overlapTextureU_pp (10,1,8,maxBound) choip 2 choip_pp
