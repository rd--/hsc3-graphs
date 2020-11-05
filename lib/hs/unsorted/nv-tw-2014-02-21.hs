-- https://twitter.com/headcube/status/437094206767513600 (nv)
-- https://soundcloud.com/nathaniel-virgo/supercollider-tweet-from-22-02
-- requires -m at scsynth

import Sound.SC3 {- hsc3 -}
import Sound.SC3.UGen.Protect {- hsc3-rw -}

x :: UGen
x = impulse AR 0.05 0

-- > audition (out 0 (f x))
f :: UGen -> UGen
f i =
    let n e = lfNoise2 e KR
        a = allpassL (leakDC i 0.995) 4 ((8 ** n 'α' 0.1) / 2) 8 * 1.2
    in tanh (lpf a ((8 ** n 'β' (mce2 (rand 'γ' 0 0.1) (rand 'δ' 0 0.1))) * 2500))

-- > audition (out 0 y)
y :: UGen
y = useq_all 'ε' 20 f x * 5

-- > audition (out 0 z)
z :: UGen
z = mix (uclone_all 'ζ' 4 y)

z_opt :: UGen
z_opt = ugen_optimise_ir_rand z

main :: IO ()
main = audition (out 0 z_opt)
