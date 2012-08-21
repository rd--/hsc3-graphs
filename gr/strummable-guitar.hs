-- strummable guitar (jmcc)

import Sound.SC3.ID {- hsc3 -}

strummable_guitar :: UGen
strummable_guitar =
    let scale = [52,57,62,67,71,76]
        str i = let x = mouseX KR 0 1 Linear 0.2
                    t = abs (hpz1 (x >* (0.25 + constant i * 0.1)))
                    e = decay t 0.05
                    n = pinkNoise i AR * e
                    dt = 1 / midiCPS (scale !! i)
                    s = combL n dt dt 4
                in pan2 s (constant i * 0.2 - 0.5) 1
        strs = mixFill (length scale) str
  in leakDC (lpf strs 12000) 0.995

main :: IO ()
main = audition (out 0 strummable_guitar)
