-- tank (jmcc)
-- <http://create.ucsb.edu/pipermail/sc-users/2004-April/009692.html>

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.UGen.Protect as Protect {- hsc3-rw -}

import qualified Sound.SC3.UGen.Bindings.DB.RDU as RDU {- sc3-rdu -}

-- * tank (jmcc)
tank_pling :: UGen
tank_pling =
    let d = dust 'α' AR 0.2
        f = expRand 'β' 300 2200
        p = rand 'γ' (-1) 1
        s1 = cubed (fSinOsc AR f 0)
        s2 = decay2 d 0.1 0.5 * 0.1 * s1
    in pan2 s2 p 1

tank_bang :: UGen
tank_bang =
    let d = dust 'δ' AR 0.01
        n = brownNoise 'ε' AR
    in pan2 (decay2 d 0.04 0.3 * n) 0 1

tank_f :: UGen -> UGen
tank_f i =
    let l0 = localIn 2 AR (mce2 0 0) * 0.98
        l1 = onePole l0 0.33
        (l1l,l1r) = unmce2 l1
        l2 = rotate2 l1l l1r 0.23
        l3 = allpassN l2 0.05 (RDU.randN 2 'θ' 0.01 0.05) 2
        l4 = delayN l3 0.3 (mce2 0.17 0.23)
        l5 = allpassN l4 0.05 (RDU.randN 2 'ι' 0.03 0.15) 2
        l6 = leakDC l5 0.995
        l7 = l6 + i
    in mrg [l7,localOut l7]

{- > let u = Protect.useq 'λ' 4 r_allpass (soundIn 0) -}
r_allpass :: UGen -> UGen
r_allpass i = allpassN i 0.03 (RDU.randN 2 'ζ' 0.005 0.02) 1

{- <http://create.ucsb.edu/pipermail/sc-users/2004-April/009692.html> -}
tank :: UGen
tank =
  let s = tank_bang + mix (Protect.uclone_all 'κ' 8 tank_pling)
  in tank_f (Protect.useq_all 'λ' 4 r_allpass s)

tank_rev :: UGen -> UGen
tank_rev = tank_f . Protect.useq_all 'λ' 4 r_allpass

main :: IO ()
main = audition (out 0 tank)
