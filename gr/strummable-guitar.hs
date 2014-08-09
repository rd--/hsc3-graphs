-- strummable guitar (jmcc) #11

import Sound.SC3 {- hsc3 -}

str :: UGen -> UGen -> UGen
str sc ix =
    let x = mouseX KR 0 1 Linear 0.2
        t = abs (hpz1 (x >* (0.25 + ix * 0.1)))
        e = decay t 0.05
        n = pinkNoise ix AR * e
        dt = 1 / midiCPS sc
        s = combL n dt dt 4
    in pan2 s (ix * 0.2 - 0.5) 1

gtr :: UGen
gtr =
    let scale = [52,57,62,67,71,76]
        strs = sum (zipWith str scale [0..])
    in leakDC (lpf strs 12000) 0.995

main :: IO ()
main = audition (out 0 gtr)
