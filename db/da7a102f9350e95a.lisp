; in ; write noise to audio bus 10, then read it out, mrg is ordered
(mrg2 (out 0 (in 1 ar 10))
      (out 10 (mul (pink-noise ar) 0.1)))
