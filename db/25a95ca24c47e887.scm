; Klank
(let ((i (Mul (Decay (Impulse 4 0) 0.03) (Mul (ClipNoise) 0.01)))
      (d (klankDataMce
	  (RandN 12 800 4000)
          (replicate 12 1)
          (RandN 12 0.1 2))))
  (Klank i 1 0 1 d))
