; In ; write noise to audio bus 10, then read it out, mrg is ordered
(Mrg2
 (In 1 10)
 (Out 10 (Mul (PinkNoise) 0.1)))
