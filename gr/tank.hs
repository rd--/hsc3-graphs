-- tank (jmcc)
-- http://create.ucsb.edu/pipermail/sc-users/2004-April/009692.html

import Sound.SC3 {- hsc3 -}
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}

pling :: UGen
pling =
    let d = dust 'α' AR 0.2
        f = expRand 'β' 300 2200
        p = rand 'γ' (-1) 1
        s1 = cubed (fSinOsc AR f 0)
        s2 = decay2 d 0.1 0.5 * 0.1 * s1
    in pan2 s2 p 1

bang :: UGen
bang =
    let d = dust 'δ' AR 0.01
        n = brownNoise 'ε' AR
    in pan2 (decay2 d 0.04 0.3 * n) 0 1

-- > let u = r_allpass (soundIn 0)
r_allpass :: UGen -> UGen
r_allpass i = allpassN i 0.03 (randN 2 'ζ' 0.005 0.02) 1

-- > let u = tank_f (soundIn 4)
tank_f :: UGen -> UGen
tank_f i =
    let l0 = localIn 2 AR (mce2 0 0) * 0.98
        l1 = onePole l0 0.33
        (l1l,l1r) = mce2c l1
        l2 = rotate2 l1l l1r 0.23
        l3 = allpassN l2 0.05 (randN 2 'θ' 0.01 0.05) 2
        l4 = delayN l3 0.3 (mce2 0.17 0.23)
        l5 = allpassN l4 0.05 (randN 2 'ι' 0.03 0.15) 2
        l6 = leakDC l5 0.995
        l7 = l6 + i
    in mrg [l7,localOut l7]

tank :: UGen
tank =
  let s = bang + mix (uclone 'κ' 8 pling)
  in tank_f (useq 'λ' 4 r_allpass s)

main :: IO ()
main = audition (out 0 tank)
