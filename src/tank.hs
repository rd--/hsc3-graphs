-- tank (jmcc)
-- http://create.ucsb.edu/pipermail/sc-users/2004-April/009692.html

import Sound.SC3.ID

pling :: UGen
pling =
    let d = dust 'a' AR 0.2
        f = expRand 'a' 300 2200
        p = rand 'a' (-1) 1
        s1 = cubed (fSinOsc AR f 0)
        s2 = decay2 d 0.1 0.5 * 0.1 * s1
    in pan2 s2 p 1

bang :: UGen
bang =
    let d = dust 'b' AR 0.01
        n = brownNoise 'b' AR
    in pan2 (decay2 d 0.04 0.3 * n) 0 1

r_allpass :: UGen -> UGen
r_allpass i =
    let r = udup 2 (rand 'c' 0.005 0.02)
    in allpassN i 0.03 r 1

tank_f :: UGen -> UGen
tank_f i =
    let r1 = udup 2 (rand 'd' 0.01 0.05)
        r2 = udup 2 (rand 'd' 0.03 0.15)
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
  let s = bang + mix (uclone 'a' 8 pling)
  in tank_f (useq 'a' 4 r_allpass s)

main :: IO ()
main = audition (out 0 tank)

{-
Sound.SC3.UGen.Dot.draw tank
-}
