; klank
(let ((i (mul (decay (impulse ar 4 0) 0.03) (mul (clip-noise ar) 0.01)))
      (d (klank-data-mce (r-rand-n 12 800 4000)
                         (make-mce (replicate 12 1))
                         (r-rand-n 12 0.1 2))))
  (klank i 1 0 1 d))
