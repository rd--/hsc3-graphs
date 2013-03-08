-- rails (jmcc)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.Protect
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

rand2 :: ID a => a -> UGen -> UGen
rand2 e n = rand e (-n) n

rails :: UGen
rails =
    let n = 20 -- resonant modes
        e = dust 'α' AR 100 * 0.04 -- excitation
        f = xLine KR 3000 300 8 DoNothing -- sweep filter down
        l = line KR (rand2 'β' 1) (rand2 'γ' 1) 8 DoNothing -- sweep pan
        r = uclone' 'δ' n (200 + linRand 'ε' 0 3000 0) -- resonant frequencies
        a = replicate n 1
        t = uclone' 'ζ' n (0.2 + rand 'η' 0 1) -- ring times
        k = klank (resonz e f 0.2) 1 0 1 (klankSpec r a t)
    in pan2 k l 1

main :: IO ()
main = overlapTextureU (3,2,4,maxBound) rails
