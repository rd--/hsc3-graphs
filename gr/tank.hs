-- tank (jmcc)
-- http://create.ucsb.edu/pipermail/sc-users/2004-April/009692.html

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.External.RDU.ID {- sc3-rdu -}

pling :: ID a => a -> UGen
pling e =
    let d = dust e AR 0.2
        f = expRand e 300 2200
        p = rand e (-1) 1
        s1 = cubed (fSinOsc AR f 0)
        s2 = decay2 d 0.1 0.5 * 0.1 * s1
    in pan2 s2 p 1

bang :: ID a => a -> UGen
bang e =
    let d = dust e AR 0.01
        n = brownNoise e AR
    in pan2 (decay2 d 0.04 0.3 * n) 0 1

r_allpass :: ID z => z -> UGen -> UGen
r_allpass e i =
    let r = randN 2 e 0.005 0.02
    in allpassN i 0.03 r 1

-- > audition (out 0 (tank_f 'α' (soundIn 4)))
tank_f :: ID z => z -> UGen -> UGen
tank_f e i =
    let r1 = randN 2 e 0.01 0.05
        r2 = randN 2 e 0.03 0.15
        l0 = localIn 2 AR * 0.98
        l1 = onePole l0 0.33
        (l1l,l1r) = mce2c l1
        l2 = rotate2 l1l l1r 0.23
        l3 = allpassN l2 0.05 r1 2
        l4 = delayN l3 0.3 (mce2 0.17 0.23)
        l5 = allpassN l4 0.05 r2 2
        l6 = leakDC l5 0.995
        l7 = l6 + i
    in mrg [l7,localOut l7]

tank :: UGen
tank =
  let s = bang 'α' + mix (uclone 'β' 8 (pling 'γ'))
  in tank_f 'δ' (useq 'ε' 4 (r_allpass 'ζ') s)

main :: IO ()
main = audition (out 0 tank)
