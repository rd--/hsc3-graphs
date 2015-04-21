-- strummable guitar (jmcc) #11

import Sound.SC3.UGen.Record.DRF {- hsc3-rec -}

str :: UGen -> Double -> Char -> UGen
str sc ix' z =
    let ix = Constant ix'
        x = MouseX KR 0 1 Linear 0.2
        t = abs (HPZ1 (x >* (0.25 + ix * 0.1)))
        e = Decay t 0.05
        n = PinkNoise z AR * e
        dt = 1 / midiCPS sc
        s = CombL n dt dt 4
    in Pan2 s (ix * 0.2 - 0.5) 1

gtr :: UGen
gtr =
    let scale = [52,57,62,67,71,76]
        strs = sum (zipWith3 str scale [0..] ['a'..])
    in leakDC {input = LPF strs 12000}

main :: IO ()
main = audition (out {input = gtr})
