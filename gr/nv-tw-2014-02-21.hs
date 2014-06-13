-- https://twitter.com/headcube/status/437094206767513600 (nv)

import Sound.SC3.ID
import Sound.SC3.UGen.Protect

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
y = useq 'ε' 20 f x * 5

-- > audition (out 0 z)
z :: UGen
z = mix (uclone 'ζ' 4 y)

main :: IO ()
main = audition (out 0 z)
