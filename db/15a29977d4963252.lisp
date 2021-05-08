; klank
(let ((i (Mul (Decay (Impulse ar 4 0) 0.03) (Mul (ClipNoise ar) 0.01)))
      (d (klank-data-mce (RRandN 12 800 4000)
                         (make-mce (replicate 12 1))
                         (RRandN 12 0.1 2))))
  (Klank i 1 0 1 d))
