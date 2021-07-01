-- strummable guitar (jmcc) #11 ; id
let strummable_guitar_str sc (ix,z) =
      let k = constant ix
          x = mouseX kr 0 1 Linear 0.2
          t = abs (hpz1 (x `greater_than` (0.25 + k * 0.1)))
          e = decay t 0.05
          n = pinkNoiseId z ar * e
          dt = 1 / midiCPS sc
          s = combL n dt dt 4
      in pan2 s (k * 0.2 - 0.5) 1
    scale = [52,57,62,67,71,76]
    strs = sum (zipWith strummable_guitar_str scale (zip [0..] ['α'..]))
in leakDC (lpf strs 12000) 0.995
