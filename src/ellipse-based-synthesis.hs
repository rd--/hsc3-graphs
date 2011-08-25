-- ellipse based synthesis (nc)
-- http://www.listarc.bham.ac.uk/lists/sc-users/msg09524.html

import Sound.SC3

ifU :: Num a => a -> a -> a -> a
ifU t i j = (t * i) + ((1 - t) * j)

ebs :: UGen -> UGen -> UGen
ebs fr sc =
    let ph = phasor AR 0 (fr * 2 * pi * sampleDur) 0 (2 * pi) 0
        sg = ifU ((ph `modE` (1.5 * pi)) >* (0.5 * pi))
                 (dc AR (-1))
                 (dc AR 1)
    in out 0 (cos (atan (sc * tan ph)) * sg)

ebs' :: UGen
ebs' =
    let fr = mouseY' KR 4 444 Linear 0.1
        sc = mouseX' KR 0.1 1.0 Linear 0.1
    in ebs fr sc

main :: IO ()
main = audition ebs'

{-
audition (ebs 440 0.5)
-}
