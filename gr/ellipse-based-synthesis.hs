-- http://www.listarc.bham.ac.uk/lists/sc-users/msg09524.html (nc)

import Sound.SC3 {- hsc3 -}

ifU :: Num a => a -> a -> a -> a
ifU t i j = (t * i) + ((1 - t) * j)

ebs_nc :: UGen -> UGen -> UGen -> UGen
ebs_nc wd fr sc =
    let ph = phasor AR 0 (fr * 2 * pi * sampleDur) 0 (2 * pi) 0
        sg = ifU ((ph `modE` (1.5 * pi)) >* (0.5 * pi)) (-1) 1
    in cos (atan (wd + sc * tan ph)) * sg

ebs_jr :: UGen -> UGen -> UGen -> UGen
ebs_jr wd fr sc =
    let ph = range 0 (2 * pi) (lfSaw AR fr 0)
        sg = ifU ((ph `modE` (1.5 * pi)) >* (0.5 * pi)) (-1) 1
    in cos (atan (wd + sc * tan ph)) * sg

ebs_jmcc :: UGen -> UGen -> UGen -> UGen
ebs_jmcc wd fr sc =
    let ph = phasor AR 0 (fr * 2 * pi * sampleDur) 0 (2* pi) 0
        sg = ifU ((ph `modE` (1.5 * pi)) >* (0.5 * pi)) (-1) 1
    in cos (atan(wd + sc * tan ph)) * sg

ctl :: (UGen -> UGen -> UGen -> t) -> t
ctl f =
    let fr = mouseY KR 4 444 Linear 0.1
        sc = mouseX KR 0.1 1.0 Linear 0.1
        wd = mouseR 'z' KR 0 2 Linear 0.1
    in f wd fr sc

main :: IO ()
main = audition (out 0 (ctl ebs_jmcc))

{-
audition (out 0 (mce2 (ebs_nc 0 440 0.5) (ebs_jr 0 440 0.5)))
audition (out 0 (mce2 (ebs_nc 0 440 0.5) (ebs_jmcc 0 440 0.5)))
-}
