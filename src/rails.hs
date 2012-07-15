-- rails (jmcc)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.Protect
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

rand2 :: ID a => a -> UGen -> UGen
rand2 e n = rand e (-n) n

rails :: UGen
rails =
    let n = 20 -- resonant modes
        e = dust 'a' AR 100 * 0.04 -- excitation
        f = xLine KR 3000 300 8 DoNothing -- sweep filter down
        l = line KR (rand2 'b' 1) (rand2 'c' 1) 8 DoNothing -- sweep pan
        r = uclone' 'a' n (200 + linRand 'd' 0 3000 0) -- resonant frequencies
        a = replicate n 1
        t = uclone' 'b' n (0.2 + rand 'e' 0 1) -- ring times
        k = klank (resonz e f 0.2) 1 0 1 (klankSpec r a t)
    in pan2 k l 1

main :: IO ()
main = overlapTextureU (2,3,4,maxBound) rails

{-
audition (out 0 rails)
Sound.SC3.UGen.Dot.draw rps
-}
