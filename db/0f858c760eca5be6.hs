-- chrd (rd, 2006-09-14)
let chrd _ =
      let m = mce [60, 65, 72, 77, 79, 84]
          d = mce (map (* 3) [5, 4, 5, 7, 4, 5])
          f = midiCPS (xLine kr m (m + rand 0.05 0.5) d DoNothing)
          z = envTrapezoid 0 (rand 0.15 0.35) d (rand 0.005 0.01)
          e = envGen kr 1 1 0 1 DoNothing z
          p = xLine kr (rand2 1) (rand2 1) d DoNothing
      in mix (pan2 (fSinOsc ar f 0) p e)
in mixFill 9 chrd
