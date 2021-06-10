; In ; write noise to audio bus 10, then read it out, mrg is ordered (crashes scsynth)
(Mrg2 (Out 0 (In 1 ar 10))
      (Out 10 (Mul (PinkNoise ar) 0.1)))
