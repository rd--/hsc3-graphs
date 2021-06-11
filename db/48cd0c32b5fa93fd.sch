-- chrd (rd, 2006-09-14) ; edit for packet size
let chrd _ =
      let m = mcefill 6 (\_ -> irand 60 84) -- [60, 65, 72, 77, 79, 84]
          d = map (* 3) [5, 4, 5, 7, 4, 5]
          f = midicps (xline m (m + rand 0.05 0.5) d donothing)
          z = envtrapezoid 0 (rand 0.15 0.35) d (rand 0.005 0.01)
          e = envgen 1 1 0 1 donothing z
          p = xline (rand2 1) (rand2 1) d donothing
      in mix (pan2 (fsinosc f 0) p e)
in mixfill 5 chrd
